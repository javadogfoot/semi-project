<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
#joinbtn1{
   background-color: navy;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
#joinbtn1:hover{
   background: #f5f4f0;
   color: navy;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
.sidebar {
font-size : 3px;
font-weight : bold;
height: 500px;
width: 200px;
color: #999;
background: #f5f4f0;
}
.sidebar a {
padding: 15px 16px 15px 16px;
text-decoration: none;
font-size: 10pt;
color: navy;
display: block;
border: 1px bold tomato;
}
.sidebar a:hover {
color: tomato;
}
form {
   text-align : center;
}
h3{
   text-align: center;
}
li {
   list-style-type: none;
}
h4 {
   text-align: center;
   margin: 0px auto;
}
aside { 
   width:200px; 
   float:left;
}
fieldset{
   margin: 0px auto;
   width: 700px;
   text-align: center;
}
   table.table tr th, table.table tr td {
       border-color: #e9e9e9;
       width: 770px;
       text-align: center;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
       background-color: #fcfcfc;
   }
   table.table-striped.table-hover tbody tr:hover {
      background: #f5f5f5;
   }
   table.table td a {
      font-weight: bold;
      color: #566787;
      display: inline-block;
      text-decoration: none;
      outline: none !important;
</style>
<script>
function showListAll(){
   location.href='communityListAll_admin.jsp';
}
function checkForm(){
	   var form=document.keywordFind;
	   /**글 제목 유효성검사*/
	   if(form.keyword.value==null||form.keyword.value==""){
	      alert('키워드를 입력해주세요.');
	      form.keyword.focus();
	      return false;
	   }
	   form.submit();
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<aside>
<div class="sidebar" style="position:absolute;">
<div></div><a href="memberList_admin.jsp">회원목록 보러가기</a>
<div></div><a href="buyList_admin.jsp">상품목록 보러가기</a>
<div></div><a href="lessonList_admin.jsp">레슨목록 보러가기</a>
<div></div><a href="communityList_admin.jsp">커뮤니티목록 보러가기</a>
<div></div><a href="qnaList_admin.jsp">큐엔에이목록 보러가기</a>
</div>
</aside>
<section>
      <h3>[커 뮤 니 티 글 조 회]</h3>
</section>
<section>
   <form name="keywordFind" method="post">
      <input type="text" name="keyword" placeholder="키워드를 입력해주세요" size="50">
      <input type="button" value="검색" id="joinbtn1" onclick="checkForm()">
      <input type="button" name="listAll" value="모두보기"  id="joinbtn1" onclick="showListAll()">
   </form>
</section>
<section>
      <%
      if(request.getMethod().equals("GET")){
         %>
         <div></div>
         <%
      }else {
         %>
         <div class="table"><jsp:include page="communityKeywordFind_ok.jsp"></jsp:include></div>
         <%
      }
      %>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>