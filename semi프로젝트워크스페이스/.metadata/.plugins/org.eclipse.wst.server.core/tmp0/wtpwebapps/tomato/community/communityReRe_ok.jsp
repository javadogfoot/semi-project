<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String c_r_con_s=request.getParameter("c_r_con");
String c_idx_s=request.getParameter("c_idx");
int c_idx=Integer.parseInt(c_idx_s);
if(c_r_con_s==null||c_r_con_s.equals("")){
	%>
	<script>
	window.alert('내용을 입력해주세요.');
	location.href='/tomato/community/communityContent.jsp?c_idx=<%=c_idx%>';
	</script>
	<%
}
%>
<jsp:useBean id="crdto" class="tomato.community_re.CommunityReDTO"></jsp:useBean>
<jsp:setProperty property="*" name="crdto"/>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>
<%
int result=cdao.reReWirte(crdto);
String msg=result>0?"댓글이 입력되었습니다.":"입력에 실패햐였습니다.";
%>
<script>
	location.href='/tomato/community/communityContent.jsp?c_idx=<%=c_idx%>';
</script>