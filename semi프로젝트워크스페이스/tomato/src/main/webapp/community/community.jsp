<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.community.*" %>

<jsp:useBean id="cdao" class="tomato.community.CommunityDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script>
	function isTest(c_idx) {
		window.location.href="/tomato/community/communityContent.jsp?c_idx=" + c_idx;
	}
</script>
<style type="text/css">
body {
	background: #f5f4f0;
	font-family: 'Roboto';
}

a{
	text-decoration:none 
}

.comm-hr {
	border: 1px solid tomato;
}

.conbtn1{
	background-color: white;
	color: tomato;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}
.conbtn1:hover{
	background-color: tomato;
	color: white;
	font-weight: bold;
	height:23px;
	border: none;
	margin:2px;
	border: 2px solid tomato;
}
.title{
	text-align: center;
}

.in{
	padding: 20px;
}

.out{
	margin: 0px auto;
	height: auto; width: 650px;
}

.clicked{
	font-weight: bold;
	text-align: center;
}

</style>
</head>
<%
int totalCnt = cdao.getTotalCnt(); //총 게시물 수
int listSize = 5; //보여줄 리스트 수
int pageSize = 5; //보여줄 페이지 수

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";
}

int cp = Integer.parseInt(cp_s); //핵심 사용자 위치

int totalPage = (totalCnt/listSize)+1;
if(totalCnt % listSize == 0)totalPage--;

int userGroup = cp/pageSize;
if(cp % pageSize == 0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<div class="title">
		<h1>커뮤니티</h1>
	</div>
	<div class="out">
	<div class="in">
	<%
	ArrayList<CommunityDTO> arr = cdao.community(cp,listSize);
	if(arr==null || arr.size()==0){
		%>
		<div style="text-align: center;">등록된 게시글이 없습니다.</div>
		<%
	}else{
			for(int i=0; i<arr.size(); i++){
				%>
				<div onclick="isTest(<%=arr.get(i).getC_idx() %>)">
				<div><br><h2>제목: <%=arr.get(i).getC_sub() %></h2></div>
		<!-- ---------null값이 들어가지 않게 유효처리 해주기---------------------------------- -->
				<div><br>&nbsp;&nbsp;내용:
				<%=
				arr.get(i).getC_con().length() >= 100 ?
						arr.get(i).getC_con().substring(0, 50) + "..." : arr.get(i).getC_con()
				%>
				 </div>
		<!-- ------------------------------------------------------------------------ -->
				<div style="text-align: right;">댓글 <%=arr.get(i).getRe_count() %>개</div></div>
				<br/>
				<hr class="comm-hr">
				<%	
			}
		}
	%>
	</div>
	<div style="text-align: right;">
		<form id="mustLogin" name="mustLogin" action="/tomato/community/communityUpload.jsp" method="post">
		<input type="submit" value="글 쓰기" class="conbtn1"/>
		</form>
	</div>
	</div>
	<div style="text-align: center;">
	<%
	if(userGroup!=0){
	%>
		<a href="community.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
		<%
		}
		%>
		<%
		for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++){
		String clickedPage=cp==i?"clicked":"unclicked";
		%><label class="<%=clickedPage%>">
		&nbsp;&nbsp;<a href="community.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;</label>
		<%
		if(i==totalPage){
			break;
		}
		}
		%>
		<%
		if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
		%>
		<a href="community.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
		<%
	}
	%>
	</div>
	
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>