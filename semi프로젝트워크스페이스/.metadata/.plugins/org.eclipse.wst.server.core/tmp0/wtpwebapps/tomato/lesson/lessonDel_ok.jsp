<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ldto" class="tomato.lesson.LessonDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto"/>
<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO" scope="session"></jsp:useBean>
<%
	String l_name=request.getParameter("l_name");
	String idx_s=request.getParameter("l_idx");
	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}
	int l_idx=Integer.parseInt(idx_s);
	int result=ldao.lessonDel(l_idx);
	String msg=result>0?"["+l_name+"]레슨 삭제 완료":"레슨 삭제 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href='lessonList.jsp';
</script>
