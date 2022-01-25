<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
String username=request.getParameter("m_name");
String useremail=request.getParameter("m_email");
String useranswer=request.getParameter("m_answer");
if(username.equals("")||username==null||useremail.equals("")||useremail==null||useranswer.equals("")||useranswer==null){
	%>
	<script>
	window.alert('값을 입력해주세요.');
	location.href='find_IdPwd.jsp';
	</script>
	<% 
	return;
}
String result=mdao.findPwdCheck(username, useremail, useranswer);
if(result!=null){
	%>
	<script>
	window.alert('이메일을 전송했습니다.');
	location.href='login.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('입력하신 정보가 없습니다.');
	location.href='find_IdPwd.jsp';
	</script>
	<%
}
%>
