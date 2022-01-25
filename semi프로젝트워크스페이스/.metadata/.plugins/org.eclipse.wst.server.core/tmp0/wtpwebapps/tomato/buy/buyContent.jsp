<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.sell.*" %>
<%@ page import="tomato.sell_re.*" %>
<%@ page import="tomato.member.*" %>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"></jsp:useBean>
<jsp:useBean id="srdao" class="tomato.sell_re.SellReDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="bdao" class="tomato.buy.BuyDAO"></jsp:useBean>
<%
String s_idx_s=request.getParameter("s_idx");
if(s_idx_s==null||s_idx_s.equals("")){
	%>
	<script>
	window.alert('존재하지 않는 게시물입니다.');
	location.href='buyList.jsp?col=s_idx&range=desc';
	</script>
	<%
	return;
}
int s_idx=Integer.parseInt(s_idx_s);
SellDTO dto=sdao.getSellContent(s_idx);
if(dto==null){
	%>
	<script>
	window.alert('존재하지 않는 게시물입니다.');
	location.href='buyList.jsp?col=s_idx&range=desc';
	</script>
	<%
	return;
}else if(dto.getS_del()==1){
	%>
	<script>
	window.alert('존재하지 않는 게시물입니다.');
	window.history.back();
	</script>
	<%
}

String imgPath=dto.getS_port();
int del=dto.getS_del();
boolean imgContain=imgPath.contains(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
body {
   background: #f5f4f0;
   font-family: 'Roboto';
}

#sell_img{
   width: 700px;
   float: left;
}
#sell_img ul{
   list-style: none;
   display: inline;
   margin-top: 50px;
   float: left;
}
#sell_img ul li{
   margin-bottom: 15px;
}
#sell_con{
   float: left;
   margin-top: 30px;
}
#sell_con ul{
   float: left;
   list-style:none;
   display: inline;
}
#sell_con h3{
   font-size: 30px;
   color: darkgray;
}
#sell_re{
   clear: both;
}
#sell_re hr{
   border:0;
   height:1px;
   background:#c2c2c2;
   align: center;
   width: 650px;
}
.reply1{
   width: 650px;
   margin: 0 auto;
}
.reply1 ul{
   list-style: none;
}
.reply1 ul li{
   margin: 10px 0;
}
.reList{
   width: 650px;
   margin: 0 auto;
}
.reList ul{
   list-style: none;
}
.reList ul li{
   margin: 15px 0;
}
#pagingArea {
   width: 650px;
   margin: 0 auto;
   text-align:center;
}
#pagingArea ul{
   list-style: none;
}
#pagingArea ul li{
   margin: 15px 0;
}
.plusBtn{
   height:80px;
   width:80px;
   backgound-color:gray;
   color:darkgray;
   font-weight:bold;
   font-size:40px;
   border:0px;
}
.plusDel{
   height:25px;
   width:25px;
   float:left;
   visibility: hidden;
}
.updateBtn{
   border:0px;
   background-color:white;
   color:teal;
   font-weight:bold;
   font-size:15px;
}
#pagingArea a{
   text-decoration:none;
   font-size: 18px;
}

.inputbtn{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
.inputbtn:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn1{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn1:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
</style>
<script>
function viewComment(reWrite){
	if(document.getElementById(reWrite).style.display=="none"){
		document.getElementById(reWrite).style.display="block";
	}else if(document.getElementById(reWrite).style.display="block"){
		document.getElementById(reWrite).style.display="none";
	}
}
function changeMainImg(getImgPath){
	document.getElementById("mainImg").src=""+getImgPath+"";
}
function plusImgPopup(){
	window.open('/tomato/sell/sellImgUpload.jsp', 'fileUpload', 'width=350, height=250');
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<%
int m_idx;
m_id=(String)session.getAttribute("m_id");
if(m_id==null||m_id.equals("")){
	m_idx=0;
}else{
	m_idx=mdao.selectMidx(m_id);
}
sdao.setCrpath("/"+m_id+"/"+s_idx);
sdao.setUserid("/"+m_id+"/"+s_idx);
sdao.setSellIdx(dto.getS_idx());
%>
<section>
<!-- 제품 이미지----------- -->
	<article id="sell_img">
	<%
	//이미지 하나
	String plusImgViewOp=m_idx!=dto.getM_idx()?"hidden":"";
	String delImgViewOp="";
	if(m_idx!=dto.getM_idx()&&m_idx!=1){
		delImgViewOp="hidden";
	}
	if(!imgContain){
		if(imgPath.equals("\\tomato\\sell\\upload\\admin\\noImage.png")){
			%>
			<ul>
				<li>
				<img src="/tomato/img/deleteImage.png" class="plusDel">
	 			<img src="<%=imgPath%>" alt="판매상품 이미지" height="80" width="80">
				</li>
				<li>
				
					<img src="/tomato/img/deleteImage.png" class="plusDel">
					<input type="button" value="+" class="plusBtn" style="visibility: <%=plusImgViewOp%>;"
					onclick="plusImgPopup();">
				</li>
			</ul>
			<img src="<%=imgPath %>" alt="판매상품 대표이미지" height="450" width="450"
		style="margin:50px;display:inline;">
			<%
		}else{
		%>
		<ul>
			<li>
			<img src="/tomato/img/deleteImage.png" class="plusDel">
 			<img src="<%=imgPath%>" alt="판매상품 이미지" height="80" width="80" >
			</li>
			<li>
				<img src="/tomato/img/deleteImage.png" class="plusDel">
				<input type="button" value="+" class="plusBtn" style="visibility: <%=plusImgViewOp%>;"
				onclick="plusImgPopup();">
			</li>
		</ul>
		<img src="<%=imgPath %>" alt="판매상품 대표이미지" height="450" width="450"
		style="margin:50px;display:inline;">
		<%
		}
		//이미지 하나 이상
	}else{
		String imgPaths[]=imgPath.split(", ");
		out.println("<ul>");
		int remainImg=5-imgPaths.length;
		for(int i=0;i<imgPaths.length;i++){
			String filePort=sdao.USERS_HOME+"/"+m_id+"/"+dto.getS_idx();
			%>
			<form name="sele_imgForm" action="deleteSellImg.jsp" method="post">
				<li>
				<input type="hidden" name="delImgPort" value="<%=sdao.DELETE_IMG_ROOT+imgPaths[i]%>">
				<input type="hidden" name="filePort" value="<%=filePort %>">
				<input type="hidden" name="s_idx" value="<%=dto.getS_idx() %>">
				<input type="hidden" name="m_id" value="<%=m_id %>">
				<input type="image" src="/tomato/img/deleteImage.png" alt="판매상품 삭제"
				style="height:25px;width:25px;float:left;visibility:<%=delImgViewOp%>;">
				<img src="<%=imgPaths[i] %>" alt="판매상품 이미지<%=i+1 %>" height="80" width="80" 
				onclick="changeMainImg('<%=imgPaths[i]%>')">
				</li>
			</form>
			<%
		}
		if(remainImg>0){
			%>
			<li>
				<img src="/tomato/img/deleteImage.png" class="plusDel">
				<input type="button" value="+" class="plusBtn" style="visibility: <%=plusImgViewOp%>;"
				onclick="plusImgPopup();">
			</li>
			<%
		}
		%>
		</ul>
		<img src="<%=imgPaths[0] %>" alt="판매상품 대표이미지" height="450" width="450"
		style="margin:50px;" id="mainImg">
		<%
	}
	%>
	</article>
	<!-- ---------제품 정보(이름, 섦명, 가격, 장바구니) -->
	<article id="sell_con">
		<form name="sell_con" method="post" action="buyItem_ok.jsp">
		<input type="hidden" name="s_idx" value="<%=s_idx%>">
		<input type="hidden" name="m_idx" value="<%=m_idx%>">
			<ul><li>
				<label style="font-size:16px;font-weight:bold;color:teal;">[<%=dto.getS_cate() %>]</label>
				<%
				String itemUpdateOp;
				if(m_idx!=dto.getM_idx()){
					itemUpdateOp="none";
				}else if(dto.getS_del()==1){
					itemUpdateOp="none";
				}else{
					itemUpdateOp="inline";
				}
				
				String itemDelOp;
				if((m_idx==1||(m_idx==dto.getM_idx())&&dto.getS_del()==0)){
					itemDelOp="inline";
				}else{
					itemDelOp="none";
				}
				%>
				<div id="updateItem" style="float:right;">
				<input type="submit" formaction="/tomato/sell/sell_update.jsp" value="수정" class="updateBtn" style="display:<%=itemUpdateOp %>;">
				<input type="submit" formaction="/tomato/sell/sell_delete.jsp" value="삭제" class="updateBtn" style="display:<%=itemDelOp %>;">
				</div>
				</li>
				<li>
				<h3><%=dto.getS_name() %></h3>
				</li>
				<hr style="width:30px;border:0;background:#c2c2c2;width:450px;height:1px;"/>
				<li><p style="line-height:2;font-size: 18px;color: dimgray;font-weight:normal;width:450px;height:180px;">
				<%=dto.getS_con().replace("\n", "<br>") %></p></li>
				<li><label style="color: tomato;font-weight:bold;font-size:28px;word-break:break-all;">
				&nbsp;<%=dto.getS_price() %></label><label style="color: dimgray;">&nbsp;&nbsp;원</label></li>
				<br/>
				<br/>
				<br/>
				<%
				int result=bdao.getbuyY_N(s_idx, m_idx);
				if(m_idx==0||dto.getS_sellok()==1||dto.getS_del()==1||m_idx==1||m_idx==dto.getM_idx()){
					%>
					<li style="float:right;">
					<label style="color: tomato;font-size:25px;">&nbsp;&nbsp;<%=dto.getS_count() %></label></li>
					<%
				}else if(result==0){
					%>
					<li style="float:right;">
					<input type="image" src="/tomato/img/cart_icon.png" alt="상품 장바구니 이미지" style="height:30px;width:30px;">
					<label style="color: tomato;font-size:25px;">&nbsp;&nbsp;<%=dto.getS_count() %></label></li>
					<%
				}else if(result==1){
					%>
					<li style="float:right;">
					<input type="image" src="/tomato/img/cart_icon_2.png" alt="상품 장바구니 이미지" 
					formaction="deletebuy_ok.jsp" style="height:30px;width:30px;">
					<label style="color: tomato;font-size:25px;">&nbsp;&nbsp;<%=dto.getS_count() %></label></li>
					<%
				}
				%>
			</ul>
		</form>
	</article>
	<br/>
	<br/>
	<!-- -------------------------- -->
	<article id="sell_re">
	<%
	int totalCnt=srdao.getTotalCnt(s_idx);
	int listSize=20;
	int pageSize=10;
	
	String currentPage_s=request.getParameter("currentPage");
	if(currentPage_s==null||currentPage_s.equals("")){
		currentPage_s="1";
	}
	int currentPage=Integer.parseInt(currentPage_s);
	
	int totalPage=totalCnt/listSize+1;
	if(totalCnt%listSize==0)totalPage--;

	int userGroup=currentPage/pageSize;
	if(currentPage%pageSize==0)userGroup--;
	//댓글 배열 저장
	ArrayList<SellReDTO> arr=srdao.sellReList(s_idx, currentPage, listSize);
	//댓글 입력 창(삭제된 )
	%>
	<form name="buyContent_re" method="post" action="write_ok.jsp">
	<br/>
	<br/>
	<input type="hidden" name="s_idx" value="<%=s_idx %>">
	<input type="hidden" name="m_idx" value="<%=m_idx %>">
	<div class="reply1">
		<ul>
			<li>
			<%
			if(arr!=null&&arr.size()!=0){
				%>
				<label style="font-weight: bold;">댓글</label>&nbsp;<label style="font-weight:bold;color:teal;"><%=totalCnt %></label>
				<%
			}else{
				%>
				<label style="font-weight: bold;">댓글</label>&nbsp;<label style="font-weight:bold;color:teal;">0</label>
				<%
			}
			%>
			</li>
			<%
			//회원이 아닐 때, 삭제된 게시물일 때 댓글 입력 불가, 
			//회원인 경우에만 댓글 입력 가능.
			String msg;
			String readOp;
			String login;
			if(dto.getS_del()==1){
				msg="삭제된 게시물입니다.";
				readOp="readonly";
				login="none";
			}else if(m_idx==0){
				msg="댓글은 회원만 작성 가능합니다.";
				readOp="readonly";
				login="none";
			}else{
				msg="댓글을 입력하세요.";
				readOp="";
				login="block";
			}
			%>
			<li>
				<textarea name="s_r_con" placeholder="<%=msg %>" cols="80" rows="4" <%=readOp %>></textarea>
			</li>
			<li>
				<input type="submit" value="입력하기" style="display:<%=login%>;">
			</li>
		</ul>
	</div>
	</form>
	<hr/>
	<!-- ------댓글 목록 -->
		<div class="reList">
		<%
		//댓글이 있을 때 
		if(arr!=null&&arr.size()!=0){
			for(int i=0;i<arr.size();i++){
				%>
				<form name="replyinput<%=i%>"  method="post" action="reWrite_ok.jsp">
				<input type="hidden" name="s_r_idx" value="<%=arr.get(i).getS_r_idx()%>">
				<input type="hidden" name="s_idx" value="<%=s_idx %>">
				<input type="hidden" name="m_idx" value="<%=m_idx %>">
				<input type="hidden" name="s_r_ref" value="<%=arr.get(i).getS_r_ref() %>">
				<input type="hidden" name="s_r_lev" value="<%=arr.get(i).getS_r_lev() %>">
				<input type="hidden" name="s_r_sunbun" value="<%=arr.get(i).getS_r_sunbun() %>">
				<div id="reList<%=i %>">
					<ul>
						<li>
						<%
						for(int k=0;k<arr.get(i).getS_r_lev();k++){
						out.println("&nbsp;&nbsp;");
						}
						
						String replyId=srdao.getMemberId(arr.get(i).getM_idx());
						if(arr.get(i).getM_idx()==dto.getM_idx()){
							replyId="[판매자] "+replyId;
						}
						%>
							<label style="font-weight: bold; width: 120px;"><%=replyId %></label>
							<label style="font-size:13px;"><%=arr.get(i).getS_r_joindate() %></label>
							<%
							int delstatus=arr.get(i).getS_r_del();
							String delOp;
							if(arr.get(i).getM_idx()==m_idx&&(delstatus==0&&dto.getS_del()==0)){
								delOp="block";
							}else if(m_idx==1&&(delstatus==0&&dto.getS_del()==0)){
								delOp="block";
							}else{
								delOp="none";
							}
							%>
							<input type="submit" value="삭제" 
							style="border:0px; color: tomato;font-weight:bold; background-color: white;float:right;display:<%=delOp %>;"
							formaction="/tomato/buy/delete_ok.jsp">
						</li>
						<li>
						<%
						for(int k=0;k<arr.get(i).getS_r_lev();k++){
						out.println("&nbsp;&nbsp;");
						}
						//댓글 쓴 사람, 관리자, 판매자만 해당 댓글 보기 가능
						String replyConView;
						int reWriter=srdao.getReWriter(arr.get(i).getS_r_ref(), arr.get(i).getS_idx());
						if(m_idx==arr.get(i).getM_idx()||m_idx==1||m_idx==dto.getM_idx()||m_idx==reWriter||dto.getM_idx()==reWriter){
							replyConView=arr.get(i).getS_r_con().replaceAll("\n", "<br>");
						}else{
							replyConView="판매자와 작성자만 댓글을 볼 수 있습니다.";
						}
						String reWriteIcon;
						if(m_idx==arr.get(i).getM_idx()||m_idx==1||m_idx==dto.getM_idx()||m_idx==reWriter){
							reWriteIcon="block";
						}else{
							reWriteIcon="none";
						}
						%>
							<label style="word-break:break-all;"><%=replyConView %></label>
						</li>
						<!-- ------대댓글 입력창 -->
						<li style="display:<%=reWriteIcon%>;">
						<%
						String replyWrite="reply"+i+"Write";
						for(int k=0;k<arr.get(i).getS_r_lev();k++){
						out.println("&nbsp;&nbsp;");
						}
						%>
						<img src="/tomato/img/comment icon.png" style="height:30px;width:30px;" onclick="viewComment('<%=replyWrite%>');">
						</li>
						<!-- -------댓글 리스트 -->
					</ul>
					<div id="reply<%=i%>Write" style="display:none;">
						<ul>
							<li>
								<textarea name="s_r_con" placeholder="<%=msg %>" cols="80" rows="4" <%=readOp %>></textarea>
							</li>
							<li>
								<input type="submit" value="입력하기" id="joinbtn1" style="display:<%=login%>;">
							</li>
						</ul>
					</div>
				</div>
				<hr/>
				</form>
				<%
			}
		}
		%>
		</div>
		<div id="pagingArea">
			<ul>
				<li>
					<%
					if(userGroup!=0){
						%>
						<a href="buyContent.jsp?currentPage=1&s_idx=<%=s_idx %>">&lt;&lt;</a>
						<a href="buyContent.jsp?currentPage=<%=(userGroup-1)*pageSize+pageSize %>&s_idx=<%=s_idx %>">&lt;</a>
						<%
					}
					%>
					<% 
					for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
						%>&nbsp;&nbsp;<a href="buyContent.jsp?currentPage=<%=i%>&s_idx=<%=s_idx %>"><%=i %></a>&nbsp;&nbsp;<%
						if(i==totalPage){
							break;
						}
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="buyContent.jsp?currentPage=<%=(userGroup+1)*pageSize+1 %>&s_idx=<%=s_idx %>">&gt;</a>
						<a href="buyContent.jsp?currentPage=<%=totalPage %>&s_idx=<%=s_idx %>">&gt;&gt;</a>
						<%
					}
					%>
				</li>
			</ul>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>