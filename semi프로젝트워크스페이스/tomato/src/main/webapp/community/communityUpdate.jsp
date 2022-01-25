<%@page import="tomato.community.CommunityDAO"%>
<%@page import="tomato.community.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>
<%
	int c_idx = Integer.parseInt(request.getParameter("c_idx"));
	CommunityDTO dto = cdao.selectCommunityByCidx(c_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style type="text/css">
body {
	background: #f5f4f0;
	font-family: 'Roboto';
}

table{
	border: 0px;
	margin: auto;
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

.updatebtn{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}

.updatebtn:hover{
	background-color: tomato;
	color: white;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}

.resetbtn{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}

.resetbtn:hover{
	background-color: tomato;
	color: white;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}
</style>
</head>
<script type="text/javascript">
function checkForm() {
	var form = document.update;
	
	/*제목 수정 유효성 검사*/
	if(form.c_sub.value == null || form.c_sub.value == ""){
		alert('제목을 입력 해주세요.');
		form.c_sub.focus();
		return false;
	}
	
	/*설명 수정 유효성 검사*/
	if(form.c_con.value == null || form.c_con.value == ""){
		alert('설명을 입력 해주세요.');
		form.c_con.focus();
		return false;
	}
	
	if(form.c_con.value.length<10||form.c_con.value.length>500){
		alert('설명은 10-500글자 이내로 입력가능합니다.');
		form.c_con.select();
		return false;
	}
	form.submit();
}
</script>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<div class="signup-form">
	<div><h3>커뮤니티 글수정</h3></div>
	<form name="update" action="communityUpdate_ok.jsp">
		<table>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" name="c_sub" size="58" value="<%=dto.getC_sub() %>"/>
				</td>
			</tr>
			<tr>
				<th style= "vertical-align: text-top">본문</th>
				<td>
				<textarea name="c_con" rows="10"  cols="60"><%=dto.getC_con()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" value="<%=dto.getC_idx() %>" name="c_idx"/>
				<input type="button" value="수정하기" class="updatebtn" onclick="checkForm()"/>
				<input type="reset" value="다시쓰기" class="resetbtn"/>
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