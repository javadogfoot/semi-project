<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
String userid=request.getParameter("userid");
if(userid==null||userid.equals("")){
	%>
	<script>
	window.alert('값을 입력해주세요.');
	location.href='idCheck.jsp';
	</script>
	<%
	return;
}
boolean result=mdao.idCheck(userid);
if(result){
	%>
	<script>
	window.alert('이미 사용중인 아이디입니다.');
	location.href='idCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('사용 가능한 아이디입니다.');
	opener.document.join.m_id.value='<%=userid %>';
	window.self.close();
	</script>
	<%
}
%>

