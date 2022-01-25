<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
String username=request.getParameter("m_name");
if(username==null||username.equals("")){
	%>
	<script>
	window.alert('값을 입력해주세요.');
	location.href='find_IdPwd.jsp';
	</script>
	<%
	return;
}

String useremail=request.getParameter("m_email");
if(useremail==null||useremail.equals("")){
	%>
	<script>
	window.alert('값을 입력해주세요.');
	location.href='find_IdPwd.jsp';
	</script>
	<%
	return;
}
String result=mdao.findIdCheck(username, useremail);
if(result==null){
	%>
	<script>
	window.alert('입력하신 정보가 없습니다.');
	location.href='find_IdPwd.jsp';
	</script>
	<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
 h3{
 	text-align: center;
 	color: dimgray;
 	font-size: 30px;
 } 
fieldset{
	border:0px;
	width: 900px;
	margin: 0px auto;
}
#userid{
	font-size: 30px;
	color: tomato;
}
#findIdBtn{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}
#findIdBtn:hover{
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
function movelogin(){
	location.href='/tomato/member/login.jsp';
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<h3 style="text-align: center;">아이디</h3>
	<fieldset>
	<div style="text-align: center;font-weight:bold;font-size:25px;">
	<%=username %>님의 아이디는 <span id="userid"><%=result %></span>입니다.
	</div>
	</fieldset>
	<br/>
	<br/>
	<div id="movelogin" style="text-align: center;">
	<input type="button" value="로그인" onclick="movelogin()" id="findIdBtn">
	</div>
	</article>
</section>
<br/>
	<br/>
	<br/>

<%@include file="/footer.jsp" %>
</body>
</html>