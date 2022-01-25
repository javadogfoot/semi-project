<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
%>      
<jsp:useBean id="mdto" class="tomato.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
int result=mdao.memberUpdate(mdto);
String msg=result>0?"수정 성공!":"수정 실패!";
%>
<script>
   window.alert('<%=msg%>');
   location.href='mypage.jsp';
</script>