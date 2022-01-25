<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="tomato.member.*" %>
<%@ page import="tomato.sell.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script>
function moveAllSellPage(){
	location.href='/tomato/buy/buyList.jsp?col=s_idx&range=desc';
}
function moveSearch(){
	var form=document.sellSearch;
	if(form.s_cate.value==""||form.s_cate==null){
		alert('품목을 선택해주세요.');
		form.s_cate.focus();
		return false;
	}
	if(form.searchValue.value==""||form.searchValue==null){
		alert('검색어를 입력해주세요.');
		form.searchValue.focus();
		return false;
	}
	form.submit();
}
</script>
<style>
body {
   background: #f5f4f0;
   font-family: 'Roboto';
}

table{
   width: 1000px;
   margin: 0px auto;
   padding: 30px;
}

table td{
   text-align: center;
   padding: 30px;
}

a { 
   text-decoration:none 
}

.searchBar{
   padding-top: 30px;
   text-align: center;
   padding-bottom: 50px;
}

.searchBar input{
   height: 35px;
   margin-right: 10px;
}

#selectBox{
   height: 40px;
   margin-right: 10px;
}

#sort{
   text-align: right;
}

#sort a{
   font-size: 18px;
   text-decoration: none;
}

.clickedSort{
   color: tomato;
   font-size: 18px;
   font-weight:bold;
}

.unclickedSort{
   color: dimgray;;
   font-size: 18px;
   font-weight:bold;
}
 
.sname{
   font-weight: bold;
   color: tomato;
}

.clicked{
   font-weight: bold;
   text-align: center;
}

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
m_id=(String)session.getAttribute("m_id");
String addr;
if(m_id==null){
	addr="강남구";
}else{
	addr=mdao.findAddr(m_id);
}

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalCnt=sdao.getTotalCnt_selling(addr);
if(m_id==null){
	totalCnt=sdao.getTotalCnt_selling(addr);
}else if(m_id.equals("admin")){
	totalCnt=sdao.getAdminTotalCnt_selling();
}
int listSize=16;
int pageSize=10;

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

String col=request.getParameter("col");
String range=request.getParameter("range");
%>
<section>
	<article>
		<form name="sellSearch" method="post" action="searchedBuyList.jsp" accept-charset="utf-8">
		<div class="searchBar">
		<input type="hidden" name="col" value="s_idx">
		<input type="hidden" name="range" value="desc">
		<select name="s_cate" id="selectBox">
			<option value="" selected disabled hidden>==선택하세요==</option>
            <option value="디지털기기">디지털기기</option>
            <option value="생활가전">생활가전</option>
            <option value="가구/인테리어">가구/인테리어</option>
            <option value="유아동">유아동</option>
            <option value="생활/가공식품">생활/가공식품</option>
            <option value="유아도서">유아도서</option>
            <option value="스포츠/레져">스포츠/레저</option>
            <option value="여성잡화">여성잡화</option>
            <option value="여성의류">여성의류</option>
            <option value="남성패션/잡화">남성패션/잡화</option>
            <option value="게임/취미">게임/취미</option>
            <option value="뷰티/미용">뷰티/미용</option>
            <option value="반려동물용품">반려동물용품</option>
            <option value="도서/티켓/음반">도서/티켓/음반</option>
            <option value="식물">식물</option>
            <option value="기타중고물품">기타중고물품</option>
		</select>
		<input type="text" name="searchValue" size="40" placeholder="찾으시는 상품을 입력해 주세요.">
		<input type="button" value="검색" onclick="moveSearch();">
		</div>
		</form>
	</article>
	<article id="sort">
	<%
	String newSort=col.equals("s_idx")&&range.equals("desc")?"clickedSort":"unclickedSort";
	String populSort=col.equals("s_count")&&range.equals("desc")?"clickedSort":"unclickedSort";
	String hPriceSort=col.equals("s_price")&&range.equals("desc")?"clickedSort":"unclickedSort";
	String lPriceSort=col.equals("s_price")&&range.equals("asc")?"clickedSort":"unclickedSort";
	%>
		<a href="/tomato/buy/buyList_selling.jsp?col=s_idx&range=desc" class="<%=newSort%>">최신순</a>|
		<a href="/tomato/buy/buyList_selling.jsp?col=s_count&range=desc" class="<%=populSort%>">인기순</a>|
		<a href="/tomato/buy/buyList_selling.jsp?col=s_price&range=desc" class="<%=hPriceSort%>">높은가격순</a>|
		<a href="/tomato/buy/buyList_selling.jsp?col=s_price&range=asc" class="<%=lPriceSort%>">낮은가격순</a>|
	</article>
<hr>
</section>
<section>
	<article>
		<table>
		<tbody>
			<%
			ArrayList<SellDTO> arr;
			if(m_id==null){
				arr=sdao.SellList_selling(cp, listSize, addr, col, range);
			}else if(m_id.equals("admin")){
				arr=sdao.adminSellList_selling(cp, listSize, col, range);
			}else{
				arr=sdao.SellList_selling(cp, listSize, addr, col, range);
			}
			if(arr==null|| arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">
					등록된 상품이 없습니다.
					</td>
				</tr>
				<tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					if(i%4==0&&i!=arr.size()-1){
						out.println("<tr>");
					}
					%>
					<td>
					<a href="buyContent.jsp?s_idx=<%=arr.get(i).getS_idx() %>">
					<%
					boolean getComma=arr.get(i).getS_port().contains(",");
					String sellY_N="[거래중] ";
					if(arr.get(i).getS_sellok()==1){
						sellY_N="[거래완료] ";
					}
					if(getComma){
						int commaPosition=arr.get(i).getS_port().indexOf(",");
						%>
						<img src="<%=arr.get(i).getS_port().substring(0,commaPosition) %>" height="240" width="240" class="simg">
						<%
					}else{
						%>
						<img src="<%=arr.get(i).getS_port() %>" height="240" width="240" class="simg">
						<%
					}
					%>
					<br/><label class="sname"><%=sellY_N %><%=arr.get(i).getS_name() %></label>
					<br/><label>가격:&nbsp;<%=arr.get(i).getS_price() %>원</label>
					</a></td>
					<%
					if(i%4==3&&i!=arr.size()-1){
						out.println("</tr>");
					}
				}
			}
			%>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="buyList_selling.jsp?cp=1&col=<%=col%>&range=<%=range%>">%lt;&lt;</a>
						<a href="buyList_selling.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>&col=<%=col%>&range=<%=range%>">&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
						String clickedPage=cp==i?"clicked":"unclicked";
						%><label class="<%=clickedPage%>">
						&nbsp;&nbsp;<a href="buyList_selling.jsp?cp=<%=i %>&col=<%=col%>&range=<%=range%>"><%=i %>
						</a>&nbsp;&nbsp;</label>
						<%
						if(i==totalPage){
							break;
						}
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="buyList_selling.jsp?cp=<%=(userGroup+1)*pageSize+1 %>&col=<%=col%>&range=<%=range%>">&gt;</a>
						<a href="buyList_selling.jsp?cp=<%=totalPage %>&col=<%=col%>&range=<%=range%>">&gt;&gt;</a>
						<%
					}
					%>
					</td>
				</tr>
			</tfoot>
		</table>	
	</article>
</section>
<hr>
<div style="float: right;">
	<img src="/tomato/img/checked.png" style="height:20px;width:20px;border:2px solid teal;" onclick="moveAllSellPage();">
	&nbsp;
	<label style="font-size:18px;text-align: top;">거래완료 상품 안보기</label>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>