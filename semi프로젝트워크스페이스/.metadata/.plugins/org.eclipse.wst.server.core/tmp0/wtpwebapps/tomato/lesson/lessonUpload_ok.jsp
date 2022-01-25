<%@page import="tomato.lesson.LessonDTO"%>
<%@page import="java.sql.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO" scope="session"></jsp:useBean>
<%
LessonDTO ldto=new LessonDTO();
ldto.setM_idx(Integer.parseInt(request.getParameter("m_idx")) );
ldto.setL_name(request.getParameter("l_name"));
ldto.setL_con(request.getParameter("l_con"));
ldto.setL_enddate(Date.valueOf(request.getParameter("l_enddate")) );
ldto.setL_people(Integer.parseInt(request.getParameter("l_people")) );
ldto.setL_addr(request.getParameter("l_addr"));

	int result=ldao.lessonWrite(ldto);
	String msg=result>0?"레슨 등록 성공":"레슨 등록 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='lessonList.jsp';
</script>