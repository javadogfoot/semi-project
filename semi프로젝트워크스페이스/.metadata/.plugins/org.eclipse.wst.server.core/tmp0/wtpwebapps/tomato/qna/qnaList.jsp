<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.qna.*" %>
<jsp:useBean id="qdao" class="tomato.qna.QnaDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style> 
table a{
   color: black;
   text-decoration:none
}

table th{
   text-align: left;
}

h3{
   text-align: center;
   font-size: 30px;
   color: tomato;
}
#table{
   margin: 0px auto;
   width: 1000px;
   border-collapse: collapse;
}
#table th{
   border-bottom: 1px solid #EB8C61;
   border-top: 2px solid #EB8C61;
   padding: 10px;
}
#table td{
   padding: 10px;
}
#joinbtnq {
   background: #f5f4f0;
   color: tomato;
   font-weight: bold;
   height: 23px;
   margin: 2px;
   border: 1px solid tomato;
}
#joinbtnq:hover {
   background-color: tomato;
   color: white;
   font-weight: bold;
   height: 23px;
   margin: 2px;
   border: none;
  }
</style>
</head>
<%
int totalCnt=qdao.getTotalCnt();//총게시물 수
int listSize=20;//보여줄 리스트 수
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
<section>
   <article>
      <h3>Q & A</h3>
      <table id="table">
         <thead>
            <tr>
               <th>NO</th>
               <th style="text-align:center">제목</th>
               <th>글쓴이</th>
               <th>작성일</th>
               <th>답변현황</th>
            </tr>
         </thead>
         <tfoot>
            <tr>
               <td colspan="5" align="center"><input type="button" value="질문하기" id="joinbtnq" onclick="location.href='qnaWrite.jsp'"></td>
            </tr>
            <tr>
               <td colspan="5" align="center">
               <%
               if(userGroup!=0){
                  %>
                  <a href="qnaList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
                  <%
               }
               %>
               <%
               for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
                  %>&nbsp;&nbsp;&nbsp;<a href="qnaList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;<%
                  if(i==totalPage){
                     break;
                  }
               }
               %>
               <%
               if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
                  %>
                  <a href="qnaList.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
                  <%
               }
               %>
               </td>
            </tr>
         </tfoot>
         <tbody>
         <%
         ArrayList<QnaDTO> arr=qdao.qnaList(cp,listSize);
         if(arr==null||arr.size()==0){
            %>
            <tr>
               <td colspan="5" align="center">등록된 Q&A글이 없습니다.</td>
            </tr>
            <%
         }else {
            for(int i=0;i<arr.size();i++){
               %>
               <tr>
                  <td><%=arr.get(i).getQ_idx() %></td>
                  <td>
                  <%
                  for(int k=0;k<arr.get(i).getQ_lev();k++){
                     out.println("&nbsp;&nbsp;");
                  }
                  %>
                  <a href="qnaContent.jsp?q_idx=<%=arr.get(i).getQ_idx() %>">
                  <%=arr.get(i).getQ_sub()%></a></td>
                  <td><%=arr.get(i).getM_id() %></td>
                  <td><%=arr.get(i).getQ_joindate() %></td>
                  <td><%=arr.get(i).getQ_status() %></td>
               </tr>
               <%
            }
         }
         %>
         </tbody>
      </table>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>