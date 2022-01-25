<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="tomato.qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="tomato.qna.QnaDAO" scope="session"></jsp:useBean>
<%
//request.setCharacterEncoding("utf-8");
String m_id=(String)session.getAttribute("m_id");
int result=qdao.qnaWrite(qdto,m_id);
String msg=result>0?"질문글이 게시되었습니다.":"글 작성 실패";
%>
<script>
window.alert('<%=msg%>');
location.href="qnaList.jsp";
</script>