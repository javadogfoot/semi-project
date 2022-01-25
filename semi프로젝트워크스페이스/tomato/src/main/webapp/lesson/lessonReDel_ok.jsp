<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="lrdao" class="tomato.lesson_re.LessonReDAO" scope="session"></jsp:useBean>
<%
	int l_r_idx=Integer.parseInt(request.getParameter("l_r_idx"));
	int l_idx=Integer.parseInt(request.getParameter("l_idx"));

	int result=lrdao.lessonReDel(l_r_idx);
	String msg=result>0?"댓글이 삭제되었습니다.":"댓글 삭제 실패";  //삭제취소눌러도 삭제됨. 수정해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%>
<script>
	/* var result=confirm('댓글을 삭제하시겠습니까?');
	if(result){ */
		window.alert('<%=msg%>');
		location.href='lessonContent.jsp?l_idx=<%=l_idx%>';
		
	<%-- }else{
		window.alert('댓글 삭제가 취소되었습니다.')
		location.href='lessonContent.jsp?l_idx=<%=l_idx%>';
	} --%>
</script>