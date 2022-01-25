<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tomato.lesson.*" %>
<%@ page import="tomato.lesson_buy.*" %>
<%@ page import="tomato.member.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="lbdto" class="tomato.lesson_buy.LessonBuyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="lbdto"/>
<jsp:useBean id="lbdao" class="tomato.lesson_buy.LessonBuyDAO" scope="session"></jsp:useBean>
<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO" scope="session"></jsp:useBean>
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
	int l_idx=Integer.parseInt(request.getParameter("l_idx"));
	int m_idx=Integer.parseInt(request.getParameter("m_idx"));
	
	boolean check=lbdao.m_idxCheck(l_idx, m_idx);
		if(check){
			ldao.getJoinCancleCnt(l_idx);
			
			int result=lbdao.lessonJoinCancle(l_idx, m_idx);
			String msg=result>0?"레슨 취소 완료":"레슨 취소 실패";
			%>
			<script>
				window.alert('<%=msg%>');
				location.href='lessonList.jsp';
			</script>
			<%
		}else{
			%>
			<script>
			window.alert('신청 내역이 없습니다.');
			location.href='lessonContent.jsp?l_idx=<%=l_idx%>';
			</script>
			<%
		}
			%>
