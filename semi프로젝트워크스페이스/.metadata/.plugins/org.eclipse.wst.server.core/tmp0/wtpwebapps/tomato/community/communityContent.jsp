<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.community.*" %>
<%@ page import="tomato.community_re.*" %>

<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"/>
<%
String c_idx_s = request.getParameter("c_idx");
if(c_idx_s == null || c_idx_s.equals("")){
	c_idx_s = "0";
}
int c_idx = Integer.parseInt(c_idx_s);

CommunityDTO dto = cdao.communityContent(c_idx);

if(dto == null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href='community.jsp';
	</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style type="text/css">
#joinbtn1{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
#joinbtn1:hover{
   background: #f5f4f0;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
body {
	background: #f5f4f0;
	font-family: 'Roboto';
}

table{
	width: 800px;
	margin: 0px auto;
	padding-bottom: 10px;
}

a{
	text-decoration:none 
}

.comm-hr {
	border: 1px solid tomato;
}

.writebtn{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}

.writebtn:hover{
	background-color: tomato;
	color: white;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}

.clicked{
	font-weight: bold;
	text-align: center;
}

</style>
</head>
<%
int totalCnt = cdao.getTotalCntRe(c_idx); //총 게시물 수
int listSize = 5; //보여줄 리스트 수
int pageSize = 5; //보여줄 페이지 수

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";
}

int cp = Integer.parseInt(cp_s); //핵심 사용자 위치

int totalPage = (totalCnt/listSize)+1;
if(totalCnt % listSize == 0)totalPage--;

int userGroup = cp/pageSize;
if(cp % pageSize == 0)userGroup--;
%>
<script type="text/javascript">
function checkForm() {
	var form = document.reply;
	
	/*댓글 유효성 검사*/
	if(form.c_r_con.value == null || form.c_r_con.value == ""){
		alert('댓글을 입력해주세요.');
		form.c_r_con.focus();
		return false;
	}else if(form.c_r_con.value.length<3 || form.c_r_con.value.length>100){
		alert('댓글은 3-100글자 이내로 입력가능합니다.');
		form.c_r_con.select();
		return false;
	}
	form.submit();
}
function viewReply(reWrite){
	if(document.getElementById(reWrite).style.display=="none"){
		document.getElementById(reWrite).style.display="block";
	}else if(document.getElementById(reWrite).style.display="block"){
		document.getElementById(reWrite).style.display="none";
	}
}

</script>
<body>
<%@include file="/header.jsp" %>
<%
int m_idx=mdao.selectMidx(m_id);
%>
<section>
<article>
	<table>
		<tr>
			<td colspan="3" align="center"><h2><%=dto.getC_sub() %></h2></td>
		</tr>
		
		<tr>
			<td colspan="2">작성자: <%=dto.getM_name() %></td>
			<td align="right">
			<%
			if(m_idx != 0 && m_idx == dto.getM_idx()){
			%>
			<div>
			<a href="communityUpdate.jsp?c_idx=<%=c_idx%>" style="color: blue;">수정하기</a>
			<a href="communityDel_ok.jsp?c_idx=<%=c_idx%>" style="color: red;">삭제하기</a>
			</div>
			<%
			} else if(m_idx != 0 && m_idx != dto.getM_idx() && m_idx == 1){
			%>
			<div>
			<a href="communityDel_ok.jsp?c_idx=<%=c_idx%>" style="color: red;">삭제하기</a>
			</div>
			<%
			} 
			%>
			작성날짜: <%=dto.getC_joindate() %>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" valign="top" align="left" style="word-break:break-all;"><%=dto.getC_con().replace("\n", "<br>") %></td>
		</tr>
	</table>
	<hr class="comm-hr">
	
	
	<table>
		<tr>
			<td>
				<%
				ArrayList<CommunityReDTO> arr = cdao.communityRe(c_idx ,cp, listSize);
				if(arr==null || arr.size()==0){
				%>
				<div style="text-align: center;">등록된 댓글이 없습니다.</div>
				<%
				}else{
					for(int i=0; i<arr.size(); i++){
				%>
				<form name="communityDel" action="communityReDel_ok.jsp">
				<input type="hidden" name="m_idx" value="<%=m_idx %>">
				<input type="hidden" name="c_r_ref" value="<%=arr.get(i).getC_r_ref() %>">
				<input type="hidden" name="c_r_lev" value="<%=arr.get(i).getC_r_lev() %>">
				<input type="hidden" name="c_r_sunbun" value="<%=arr.get(i).getC_r_sunbun() %>">
					<div class="commnet_box">
						<div class="comment">
						<%
						for(int k=0;k<arr.get(i).getC_r_lev();k++){
							out.println("&nbsp;&nbsp;");
						}
						String replyView="reply"+i+"View";
						%>
							<span><%=arr.get(i).getM_name() %> : <%=arr.get(i).getC_r_con() %></span>
							<%
								if((m_idx == 1 || m_idx == arr.get(i).getM_idx()) && arr.get(i).getC_r_del()==0) {
									%>
									<input type="submit" value="X" id="joinbtn1"/>
									<%
								}
								if(m_idx!=0&&arr.get(i).getC_r_del()==0){
									%>
									<input type="button" value="re" id="joinbtn1" onclick="viewReply('<%=replyView%>');">
									<%
								}
							%>
						</div>
					</div>
					<input name="c_r_idx" type="hidden" value=<%=arr.get(i).getC_r_idx() %> />
					<input type="hidden" name="c_idx" value="<%=c_idx %>"/>
					<div id="reply<%=i %>View" style="display: none;">
						<table>
							<tr>
								<td>
								<%
								for(int k=0;k<arr.get(i).getC_r_lev();k++){
									out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
								}
								%>
								</td>
								<td align="right"><%=m_id %></td>
								<td>
									<textarea name="c_r_con" rows="5" cols="90" placeholder="댓글을 작성해주세요."></textarea>
								</td>
								<td>
									<input type="submit" value="작성하기" class="writebtn" formaction="communityReRe_ok.jsp">
								</td>
							</tr>
						</table>
					</div>
				</form>
				<%
				}
			}
				%>
			</td>
		</tr>
	</table>
	<form name="reply" action="communityRe_ok.jsp">
	<table>
		<tr>
			<td align="right">댓글</td>
			<td align="center">
			<br>
			<br>
			<br>
			<input type="hidden" name="c_idx" value="<%=c_idx %>"/>
			<input type="hidden" name="m_idx" value="<%=m_idx %>"/>
			<textarea name="c_r_con" rows="5" cols="90" placeholder="댓글을 작성해주세요."></textarea>
			</td>
			
			<td align="left">
			<input type="button" value="작성하기" class="writebtn" onclick="checkForm()">
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="right">
			<a href="community.jsp">목록으로 가기</a></td>
		</tr>
			
		<tr>
			<td colspan="3" align="center">
			<!-- -------------------------페이징 들어갈 영역------------------------------ -->
		<%
			if(userGroup!=0){
				%>
				<a href="communityContent.jsp?c_idx=<%=c_idx %>&cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
				<%
			}
				%>
				<%
			for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++){
			String clickedPage=cp==i?"clicked":"unclicked";
			%><label class="<%=clickedPage%>">
			&nbsp;&nbsp;<a href="communityContent.jsp?c_idx=<%=c_idx %>&cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;</label><%
			if(i==totalPage){
				break;
			}
			}
				%>
				<%
			if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
				%>
				<a href="communityContent.jsp?c_idx=<%=c_idx %>&cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
				<%
		}
		%>
			<!-- -------------------------------------------------------------------- -->
			</td>
		</tr>
	</table>
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>