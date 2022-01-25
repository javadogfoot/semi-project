<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="crdto" class="tomato.community_re.CommunityReDTO"></jsp:useBean>
<jsp:setProperty property="*" name="crdto"/>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>
<%
int c_idx = Integer.parseInt(request.getParameter("c_idx"));

int result = cdao.communityReDel(crdto);
String msg = result > 0? "댓글이 삭제되었습니다.":"댓글이 삭제되지 않았습니다.";
%>
<script>
window.alert('<%=msg %>');
location.href = 'communityContent.jsp?c_idx=' + <%=c_idx%>;
</script>