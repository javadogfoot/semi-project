<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdto" class="tomato.sell.SellDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<%
int result=sdao.updateSell(sdto);
String msg=result>0?"제품 정보 수정이 완료되었습니다.":"제품 정보 수정에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='/tomato/buy/buyContent.jsp?s_idx=<%=sdto.getS_idx()%>';
</script>