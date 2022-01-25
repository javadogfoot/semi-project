<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="tomato.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
int result=mdao.memberJoin(mdto);
String msg=result>0?"회원가입이 성공적으로 완료되었습니다.":"회원가입에 실패하셨습니다.";
%>
<script>
window.alert('<%=msg %>');
location.href='/tomato/index.jsp';
</script>
