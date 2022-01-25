<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style type="text/css">
body {
	color: #999;
	background: #f5f4f0;
	font-family: 'Roboto';
}

table{
	border: 0px;
	margin: 0px auto;
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

.uploadbtn{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}
.uploadbtn:hover{
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
	var form = document.upload;
	
	/*제목 유효성 검사*/
	if(form.c_sub.value == null || form.c_sub.value == ""){
		alert('제목을 입력해주세요.');
		form.c_sub.focus();
		return false;
	}
	
	/*본문 유효성 검사*/
	if(form.c_con.value == null || form.c_con.value == ""){
		alert('내용을 입력해주세요.');
		form.c_con.focus();
		return false;
	}else if(form.c_con.value.length<10||form.c_con.value.length>500){
		alert('글 내용은 10-500글자 이내로 입력가능합니다.');
		form.c_con.select();
		return false;
	}
	form.submit();
}
</script>
<body>
<%@include file="/header.jsp" %>
<%
int m_idx=mdao.selectMidx(m_id);
%>
<%
	if(m_id == null || m_id.equals(" ")){
	%>
	<script>
	window.alert('로그인 후 이용 가능한 서비스입니다.');
	location.href="/tomato/member/login.jsp";
	</script>
	<%
	return;
	}
%>
<section>
<article>
	<div class="signup-form">
	<div align="center"><h3>커뮤니티 글작성</h3></div>
	<form name="upload" action="communityUpload_ok.jsp">
	<table>
		<tr>
			<th>제목</th>
			<td>
			<input type="text" name="c_sub" size="58" placeholder="제목"></input>
			</td>
		</tr>
		<tr>
			<th style= "vertical-align: text-top">본문</th>
			<td>
			 <textarea name="c_con" rows="10" cols="60" placeholder="본문"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="hidden" name="m_idx" value="<%=m_idx%>">
			<input type="button" value="작성하기" class="uploadbtn" onclick="checkForm()">
			<input type="reset" value="다시쓰기" class="resetbtn">
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