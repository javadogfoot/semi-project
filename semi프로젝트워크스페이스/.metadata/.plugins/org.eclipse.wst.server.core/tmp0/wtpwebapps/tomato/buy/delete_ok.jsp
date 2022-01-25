<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="srdao" class="tomato.sell_re.SellReDAO"></jsp:useBean>
<%
String s_r_idx_s=request.getParameter("s_r_idx");
String s_idx_s=request.getParameter("s_idx");
int s_r_idx=Integer.parseInt(s_r_idx_s);
int s_idx=Integer.parseInt(s_idx_s);
srdao.deleteReply(s_r_idx);
%>
<script>
location.href='/tomato/buy/buyContent.jsp?s_idx=<%=s_idx%>';
</script>