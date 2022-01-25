<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String searchValue=request.getParameter("searchValue");
if(searchValue==null){
	%>
	<script>
	window.alert('검색어를 입력해주세요.');
	location.href='/tomato/index.jsp';
	</script>
	<%
	return;
}
%>
<%@ page import="tomato.sell.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
</head>
<style>
table{
	width: 1000px;
	margin: 0px auto;
	padding: 30px;
}
table td{
	text-align: center;
	padding: 30px;
}
.sname{
	font-weight: bold;
	color: tomato;
}
.clicked{
	border: 0.5px solid white;
	background-color:teal;
	text-align: center;
}
</style>
<body>
<%@include file="/header.jsp" %>
<%
String col=request.getParameter("col");
String range=request.getParameter("range");
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int totalCnt;
totalCnt=sdao.headerTotalCnt(searchValue);

int listSize=16;
int pageSize=10;

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<section>
<article>
		<table>
		<tbody>
			<%
			ArrayList<SellDTO> arr=sdao.headerSellList(searchValue, cp, listSize);
			
			if(arr==null|| arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">
					검색된 상품이 없습니다.
					</td>
				</tr>
				<tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					if(i%4==0&&i!=arr.size()-1){
						out.println("<tr>");
					}
					%>
					<td>
					<a href="buyContent.jsp?s_idx=<%=arr.get(i).getS_idx() %>">
					<%
					boolean getComma=arr.get(i).getS_port().contains(",");
					String sellY_N="[거래중] ";
					if(getComma){
						int commaPosition=arr.get(i).getS_port().indexOf(",");
						%>
						<img src="<%=arr.get(i).getS_port().substring(0,commaPosition) %>" height="240" width="240" class="simg">
						<%
					}else{
						%>
						<img src="<%=arr.get(i).getS_port() %>" height="240" width="240" class="simg">
						<%
					}
					%>
					<br/><label class="sname"><%=sellY_N %><%=arr.get(i).getS_name() %></label>
					<br/><label><%=arr.get(i).getS_price() %></label>
					</a></td>
					<%
					if(i%4==3&&i!=arr.size()-1){
						out.println("</tr>");
					}
				}
			}
			%>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="headerBuySearch?cp=1&col=<%=col%>&range=<%=range%>&searchValue=<%=searchValue%>">%lt;&lt;</a>
						<a href="headerBuySearch?cp=<%=(userGroup-1)*pageSize+pageSize %>&col=<%=col%>&range=<%=range%>&searchValue=<%=searchValue%>">&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
						String clickedPage=cp==i?"clicked":"unclicked";
						%><label class="<%=clickedPage%>">
						&nbsp;&nbsp;<a href="headerBuySearch.jsp?cp=<%=i %>&col=<%=col%>&range=<%=range%>&searchValue=<%=searchValue%>"><%=i %>
						</a>&nbsp;&nbsp;</label>
						<%
						if(i==totalPage){
							break;
						}
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="headerBuySearch.jsp?cp=<%=(userGroup+1)*pageSize+1 %>&col=<%=col%>&range=<%=range%>&searchValue=<%=searchValue%>">&gt;</a>
						<a href="headerBuySearch.jsp?cp=<%=totalPage %>&col=<%=col%>&range=<%=range%>&searchValue=<%=searchValue%>">&gt;&gt;</a>
						<%
					}
					%>
					</td>
				</tr>
			</tfoot>
		</table>	
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>