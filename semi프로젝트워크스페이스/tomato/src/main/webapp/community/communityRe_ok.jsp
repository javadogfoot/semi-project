<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String m_id = (String)session.getAttribute("m_id");

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

<jsp:useBean id="crdto" class="tomato.community_re.CommunityReDTO"></jsp:useBean>
<jsp:setProperty property="*" name="crdto"/>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>

<%
int result = cdao.communityRe(crdto);
String msg = result>0? "댓글 작성 성공!" : "댓글 작성 실패!";
%>
<script>
window.alert('<%=msg %>');
location.href = 'communityContent.jsp?c_idx=<%=crdto.getC_idx()%>';
</script>