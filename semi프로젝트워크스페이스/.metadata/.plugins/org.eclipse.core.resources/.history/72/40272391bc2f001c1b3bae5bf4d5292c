<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bdto" class="tomato.buy.BuyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="tomato.buy.BuyDAO"></jsp:useBean>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<%
int result=bdao.deleteBuyItem(bdto.getS_idx(), bdto.getM_idx());
if(result==1){
	int count=sdao.minusBuyCount(bdto.getS_idx());
}
%>
<script>
location.href='/tomato/buy/buyContent.jsp?s_idx=<%=bdto.getS_idx()%>';
</script>
