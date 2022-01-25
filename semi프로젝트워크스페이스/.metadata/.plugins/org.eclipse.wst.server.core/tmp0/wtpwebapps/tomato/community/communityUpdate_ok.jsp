<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdto" class="tomato.community.CommunityDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>

<%
int result = cdao.communityUpdate(cdto);
String msg = result > 0 ? "글 수정 완료!!" : "글 수정 실패!!";
%>
<script>
window.alert('<%=msg%>');
location.href='community.jsp';
</script>







