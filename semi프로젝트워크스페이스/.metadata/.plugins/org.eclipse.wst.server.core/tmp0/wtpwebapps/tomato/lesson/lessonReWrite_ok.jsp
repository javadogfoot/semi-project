<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lrdto" class="tomato.lesson_re.LessonReDTO"></jsp:useBean>
<jsp:setProperty property="*" name="lrdto"/>
<jsp:useBean id="lrdao" class="tomato.lesson_re.LessonReDAO" scope="session"></jsp:useBean>
<%
String m_id=(String)session.getAttribute("m_id");

if(m_id==null||m_id.equals("")){
	%>
	<script>
	window.alert('로그인 후 이용 가능합니다');
	location.href='/tomato/member/login.jsp';
	</script>
	<%
	return;
}
%>
<%

	int result=lrdao.lessonReWrite(lrdto);
	String msg=result>0?"댓글 입력 성공":"댓글 입력 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href='lessonContent.jsp?l_idx=<%=lrdto.getL_idx()%>';
</script>