<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 600px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form h3 {
	color: dimgray;
	font-size: 40px;
	margin: 0 0 15px;
	text-align: center;
}

.signup-form form {
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

a { 
text-decoration:none 
} 

h3{
	text-align: center;
}
table{
	border: 0px;
	margin: 0px auto;
}
</style>
</head>
<%
String q_sub=request.getParameter("q_sub");
String q_ref=request.getParameter("q_ref");
String q_lev=request.getParameter("q_lev");
String q_sunbun=request.getParameter("q_sunbun");
int q_idx=Integer.parseInt(request.getParameter("q_idx"));
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<div class="signup-form">
		<h3>답변하기</h3>
		<form name="qnaReWrite.jsp" action="qnaReWrite_ok.jsp">
      	<input type="hidden" name="q_ref" value="<%=q_ref %>">
     	<input type="hidden" name="q_lev" value="<%=q_lev %>">
        <input type="hidden" name="q_sunbun" value="<%=q_sunbun %>">
        <input type="hidden" name="q_idx" value="<%=q_idx %>">
		<table>
			<tr>
				<th>질문</th>
				<td><input type="text" name="q_sub" size="48" value="답변:<%=q_sub%>"></td>
			</tr>
			<tr>
				<th style= "vertical-align: text-top">내용</th>
				<td><textarea rows="10" cols="50" name="q_con"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="작성하기">
				<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>