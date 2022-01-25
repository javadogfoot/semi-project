<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h3{
	text-align: center;
	
}
form{
	text-align: center;
}
input{
	height: 18px;
}
#checkBtn{
	background-color: lightgray;
	color: black;
	font-weight: bold;
	height: 23px;
	margin: 2px;
	border: 2px solid lightgray;
}
</style>
</head>
<body>
	<h3>아이디 중복체크</h3>
	<hr/>
		<form name="idCheck" onsubmit="return validate();" action="idCheck_ok.jsp">
		<label>아이디</label>
		<input type="text" name="userid">
		<input type="submit" value="중복검사" id="checkBtn">	
		</form>
</body>
</html>