<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.qna.*" %>
<jsp:useBean id="qdao" class="tomato.qna.QnaDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");
String idx_s=request.getParameter("q_idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int q_idx=Integer.parseInt(idx_s);
QnaDTO dto=qdao.qnaContent(q_idx);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href='qnaList.jsp';
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
<style>

body {
	background: #f5f4f0;
	font-family: 'Roboto';
}

.signup-form {
	width: 1200px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form h3 {
	color: dimgray;
	font-size: 40px;
	margin: 0 0 15px;
	text-align: center;
}

.signup-form table {
	width: 700px;
	margin: 0px auto;
	border-radius: 1px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
a { 
	text-decoration:none 
}
table th{
    padding: 10px;
}
table td{
    padding-left: 10px;
}
table td a{
	color: gray;
}
table td a:hover{
	font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
int m_idx=mdao.selectMidx(m_id);
%>
<section>
	<article>
		<div class="signup-form">
		<table>
	         <tr>
	            <th>제목</th>
	            <td colspan="3"><%=dto.getQ_sub() %></td>
	         </tr>
			<tr>
	            <th>작성자</th>
	            <td><%=dto.getM_id() %></td>
	        </tr>
	        <tr>
	            <th>작성날짜</th>
	            <td><%=dto.getQ_joindate() %></td>
	         </tr>
	         <tr height="250" width="500">
	            <td colspan="2" valign="top" align="left" style="word-break:break-all; padding: 40px 40px 40px 60px; border-top: 1px solid;">
		           	<%if(dto.getQ_con()!=null){
	                %>
	                <%=dto.getQ_con().replaceAll("\n", "<br>") %>
	                <%
	           		}
	           		 %>
	            </td>
	         </tr>
	         </table>
	         <hr>
	         <table>
	         <tr>
	            <td colspan="4" align="center">
	            <%
	            if(m_idx != 0 && m_idx == dto.getM_idx() && m_idx != 1){
	            	 %>
	            	 <a href="qnaDel_ok.jsp?q_idx=<%=q_idx%>">삭제하기</a>
	            	 <%
	            }else if(m_idx != 0 && m_idx == 1){
	            	 %>
	            	 <a href="qnaDelAdmin_ok.jsp?q_idx=<%=q_idx%>">삭제하기</a>
	            	 <a href="qnaReWrite.jsp?q_idx=<%=q_idx %>&q_sub=<%=dto.getQ_sub()%>&q_ref=<%=dto.getQ_ref()%>&q_lev=<%=dto.getQ_lev()%>&q_sunbun=<%=dto.getQ_sunbun()%>">| 답변쓰기</a>
	            	 <%
	            }
	            %>
	            </td>   
	         </tr>
	         <tr>
	         	<td colspan="4" align="center"><a href="javascript:history.back();">목록으로</a></td>
	         </tr>
	         </table>
	     </div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>