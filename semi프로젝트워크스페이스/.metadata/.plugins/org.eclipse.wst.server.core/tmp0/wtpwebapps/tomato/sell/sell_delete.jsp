<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String s_idx_s=request.getParameter("s_idx");
int s_idx=Integer.parseInt(s_idx_s);
%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<%
int result=sdao.deleteSell(s_idx);
String msg=result>0?"게시물이 삭제되었습니다.":"삭제가 불가능합니다. 고객 센터로 연락해주세요.";
%>
<script>
window.alert('<%=msg%>');
location.href='/tomato/index.jsp';
</script>