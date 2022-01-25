<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
String m_id=(String)session.getAttribute("m_id");
int result=mdao.memberDelete(m_id);
String msg=result>0?"회원탈퇴성공":"회원탈퇴실패";
session.invalidate();
%>
<script>
window.alert('<%=msg%>');
location.href='/tomato/index.jsp';
</script>