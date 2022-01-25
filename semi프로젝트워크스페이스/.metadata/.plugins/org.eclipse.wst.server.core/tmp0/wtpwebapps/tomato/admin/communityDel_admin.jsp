<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdto" class="tomato.community.CommunityDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>
<%
int c_idx = Integer.parseInt(request.getParameter("c_idx"));

int result = cdao.communityDel(c_idx);
String msg = result > 0? "게시글이 삭제되었습니다.":"게시글이 삭제되지 않았습니다.";
%>
<script>
window.alert('<%=msg %>');
location.href = 'communityListAll_admin.jsp';
</script>