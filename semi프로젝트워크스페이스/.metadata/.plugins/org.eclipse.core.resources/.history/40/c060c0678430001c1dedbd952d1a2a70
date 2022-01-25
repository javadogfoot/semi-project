<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.sell.*" %>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
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
           <h2>검색한 <b>상품</b></h2>
<table class="table table-striped table-hover" style="margin-left:200px;">
         <thead>
            <tr>
               <th>글번호</th>
               <th>상품이름</th>
               <th>상품가격</th>
               <th>카테고리</th>
               <th>상품설명</th>
            </tr>
         </thead>
         <tbody>
         <%
            ArrayList<SellDTO> arr=sdao.keywordFind(keyword);
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="5" align="center">
                  등록된 상품판매 글이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  %>
                  <tr>
                    <td><%=arr.get(i).getS_idx() %></td>             
                    <td><a href="/tomato/buy/buyContent.jsp?s_idx=<%=arr.get(i).getS_idx() %>"><%=arr.get(i).getS_name() %></a></td>             
                    <td><%=arr.get(i).getS_price() %></td>             
                    <td><%=arr.get(i).getS_cate() %></td>             
                    <td><%=arr.get(i).getS_con().substring(0,10) %>...</td>            
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