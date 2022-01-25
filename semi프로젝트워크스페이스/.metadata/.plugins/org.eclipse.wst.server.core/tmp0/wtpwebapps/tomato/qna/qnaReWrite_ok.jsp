<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="tomato.qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="tomato.qna.QnaDAO" scope="session"></jsp:useBean>
<%
//request.setCharacterEncoding("utf-8");
int q_idx=Integer.parseInt(request.getParameter("q_idx"));
int result=qdao.qnaReWrite(qdto);
qdao.recomplete(q_idx);
String msg=result>0?"답변글이 게시되었습니다.":"글 작성 실패";
%>
<script>
window.alert('<%=msg%>');
location.href="qnaList.jsp";
</script>