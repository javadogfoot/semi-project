<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String s_r_con=request.getParameter("s_r_con");
String s_idx_s=request.getParameter("s_idx");
int s_idx=Integer.parseInt(s_idx_s);

if(s_r_con==null||s_r_con.equals("")){
	%>
	<script>
	window.alert('댓글을 입력하세요.');
	location.href='/tomato/buy/buyContent.jsp?s_idx=<%=s_idx%>';
	</script>
	<%
	return;
}
%>
<jsp:useBean id="srdto" class="tomato.sell_re.SellReDTO" ></jsp:useBean>
<jsp:setProperty property="*" name="srdto"/>
<jsp:useBean id="srdao" class="tomato.sell_re.SellReDAO"></jsp:useBean>
<%
int result=srdao.replyWrite(srdto);
%>
<script>
location.href='/tomato/buy/buyContent.jsp?s_idx=<%=srdto.getS_idx()%>';
</script>
