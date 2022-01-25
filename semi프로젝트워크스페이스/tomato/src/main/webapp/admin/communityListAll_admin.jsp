<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*" %>
<%@ page import="tomato.community.*" %>
<jsp:useBean id="cdao" class="tomato.community.CommunityDAO"></jsp:useBean>
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
form {
   text-align : center;
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
   }
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
<%
int totalCnt=cdao.getTotalCnt();//총게시물 수
int listSize=40;//보여줄 리스트 수
int pageSize=5;//보여줄 페이지 수 

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
   cp_s="1";
}

int cp=Integer.parseInt(cp_s);//사용자 위치

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;


int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
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
      <h3>[커뮤니티 글 조 회]</h3>
</section>
<section>
   <form name="keywordFind" method="post">
      <input type="text" name="keyword" placeholder="키워드를 입력해주세요" size="50">
      <input type="button" value="검색" id="joinbtn1" onclick="checkForm()">
      <input type="button" name="listAll" value="모두보기" id="joinbtn1" onclick="showListAll()">
   </form>
</section>
<section>
      <%
      if(request.getMethod().equals("GET")){
         %>
</section>
       <article>
            <h2>커뮤니티 글 <b>목록</b></h2>
           <table class="table table-striped table-hover" style="margin-left:200px;">
         <thead>
            <tr>
               <th>글번호</th>
               <th>글제목</th>
               <th>작성자</th>
               <th>작성일</th>
               <th>관리자 전용</th>
            </tr>
         </thead>
         <tfoot>
            <tr>
               <td colspan="4" align="center">
               <%
               if(userGroup!=0){
                  %>
                  <a href="communityListAll_admin.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
                  <%
               }
               %>
               <%
               for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
                  %>&nbsp;&nbsp;&nbsp;<a href="communityListAll_admin.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;<%
                  if(i==totalPage){
                     break;
                  }
               }
               %>
               <%
               if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
                  %>
                  <a href="communityListAll_admin.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
                  <%
               }
               %>
               </td>
            </tr>
         </tfoot>
         <tbody>
            <%
            ArrayList<CommunityDTO> arr=cdao.community(cp,listSize);
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="5" align="center">
                  등록된 커뮤니티 글이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  %>
                  <tr>
                    <td><%=arr.get(i).getC_idx() %></td>             
                    <td><a href="/tomato/community/communityContent.jsp?c_idx=<%=arr.get(i).getC_idx() %>"><%=arr.get(i).getC_sub().substring(0,5)%>...</a></td>             
                    <td><%=arr.get(i).getM_name() %></td>             
                    <td><%=arr.get(i).getC_joindate() %></td>
                    <td><a href="/tomato/admin/communityDel_admin.jsp?c_idx=<%=arr.get(i).getC_idx() %>">삭제</a></td>             
                 </tr>
                  <%
               }
            }
            %>
           </tbody>
        </table>
        </article>
         <%
      }else {
         %>
         <jsp:include page="communityKeywordFind_ok.jsp"></jsp:include>
         <%
      }
      %>
<%@include file="/footer.jsp" %>
</body>
</html>