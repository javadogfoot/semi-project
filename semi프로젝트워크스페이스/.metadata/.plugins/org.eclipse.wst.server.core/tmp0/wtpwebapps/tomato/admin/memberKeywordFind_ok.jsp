<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.member.*" %>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String keyword=request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<section>
   <article>
           <h2>검색한 <b>회원</b></h2>
  <table class="table table-striped table-hover" style="margin-left:200px; margin-top:25px;">
         <thead>
            <tr>
               <th>회원번호</th>
               <th>ID</th>
               <th>이름</th>
               <th>주소</th>
               <th>e-mail</th>
               <th>전화번호</th>
               <th>생일</th>
               <th>가입날짜</th>
            </tr>
         </thead>
         <tbody>
         <%
            ArrayList<MemberDTO> arr=mdao.keywordFind(keyword);
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="8" align="center">
                  등록된 회원이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  %>
                  <tr>
                    <td><%=arr.get(i).getM_idx()%></td>
                  <td><%=arr.get(i).getM_id() %></td>
                  <td><%=arr.get(i).getM_name() %></td>
                  <td><%=arr.get(i).getM_addr() %></td>
                  <td><%=arr.get(i).getM_email() %></td>
                  <td><%=arr.get(i).getM_tel() %></td>
                  <td><%=arr.get(i).getM_birth() %></td>
                  <td><%=arr.get(i).getM_joindate() %></td>             
                 </tr>
                  <%
               }
            }
            %>
         </tbody>
      </table>
   </article>
</section>
</body>
</html>