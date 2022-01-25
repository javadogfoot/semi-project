<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.qna.*" %>
<jsp:useBean id="qdao" class="tomato.qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
#joinbtn1{
   background-color: #f5f4f0;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
#joinbtn1:hover{

   background: #f5f4f0;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
.dropdown-menu {
   padding: 0 30px;
   height: 100%;
   font-size: 15px;
   text-align: left;
   color: #333333;
   line-height: 50px;
}

.dropdown-menu>ul {
   text-align: left;
   padding-left: 0;
    float:left;
}

.menu1>ul {
   list-style: none;
   opacity: 0;
   visibility: hidden;
   display: block;
   -webkit-transition: all 2s;
   transition: all 2s;
}

.menu1:hover>ul {
   visibility: visible;
   opacity: 1;
}

.menu1 {
   width: 100%;
   height: 50px;
   display: block;
   overflow: hidden;
   -webkit-transition: all 2s;
   transition: all 1s;
}

.menu1:hover {
   height: 250px;
}

.ul {
   list-style: none;
}

.ul>.menu2 {
   text-align: left;
   font-size: 5px;
}
h3{
   padding: 12px 15px;
   text-align:center;
   font-size:red;
}
body {
      background: #f5f4f0;
      font-family: 'Varela Round', sans-serif;
      font-size: 13px;
   }
table.table tr th, table.table tr td {
        border-color: #e9e9e9;
      padding: 12px 15px;
       width: 390px;
         margin: 0 auto;
         padding: 30px 0;
         text-align:center;
            
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
   function changeForm(val) {
      if (val == "0") {
         location.href = '/tomato/member/memberUpdate.jsp';
         
      } else if(val =="1") {
         location.href = '/tomato/member/memberDelete_ok.jsp';
         
      } else if(val == "2"){
         location.href='/tomato/member/mypage_buy.jsp';
         
      } else if(val == "3"){
         location.href='/tomato/member/mypage_qna.jsp';
         
      } else if(val =="4"){
         location.href='/tomato/member/mypage_mylesson.jsp';
         
      } else if(val =="5"){
         location.href='/tomato/member/mypage_community.jsp';
   }
      else if(val=="6"){
         location.href='/tomato/member/mypage_lesson.jsp';
      }else if(val=="7"){
    	  location.href='/tomato/member/mypage_sell.jsp';
      }
 }
</script>
</head>
<%
int totalCnt=qdao.getTotalCnt();//총게시물 수
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
<%int m_idx=mdao.selectMidx(m_id); %>

<aside>
      <div class="dropdown-menu">
<ul>
   <li class="menu1"><b>내가 찜한 상품</b>
      <ul>
         <li><input type="button" value="SELL" id="joinbtn1" onclick="changeForm(2)"> </li>         
      </ul>
   </li>
   <hr>
   <li class="menu1"><b>내가 올린 글</b>
      <ul>
         <li><input type="button" value="Q & A" id="joinbtn1" onclick="changeForm(3)"> </li>         
         <li><input type="button" value="LESSON" id="joinbtn1" onclick="changeForm(4)"></li>         
         <li><input type="button" value="COMMUNITY" id="joinbtn1" onclick="changeForm(5)"></li>
         <li><input type="button" value="SELL" id="joinbtn1" onclick="changeForm(7)"></li>
      </ul>
   </li>
   <hr>
   <li class="menu1"><b>내가 신청한 과정</b>
      <ul>
         <li><input type="button" value="LESSON" id="joinbtn1" onclick="changeForm(6)"> </li>         
      </ul>
   </li>
</ul>
      </div>
</aside>
         <div class="table-title">
            <h3>내가 작성한 Q & A 글</h3>
         </div>
          <table class="table table-striped table-hover">
            <tr>
               <th>글번호</th>
               <th>글제목</th>
               <th>작성일</th>
               <th>답변현황</th>
            </tr>
            <%
            ArrayList<QnaDTO> arr=qdao.mypageQna(m_idx,cp,listSize);
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="5" align="center">
                  등록된 Q&A글이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  %>
                  <tr>
                    <td><%=arr.get(i).getQ_idx() %></td>             
                    <td><a href="/tomato/qna/qnaContent.jsp?q_idx=<%=arr.get(i).getQ_idx() %>"><%=arr.get(i).getQ_sub() %></a></td>             
                    <td><%=arr.get(i).getQ_joindate() %></td>             
                    <td><%=arr.get(i).getQ_status() %></td>
                 </tr>
                  <%
               }
            }
            %>
            <tr>
               <td colspan="4" align="center">
               <%
               if(userGroup!=0){
                  %>
                  <a href="mypage_qna.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
                  <%
               }
               %>
               <%
               for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
                  %>&nbsp;&nbsp;&nbsp;<a href="mypage_qna.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;<%
                  if(i==totalPage){
                     break;
                  }
               }
               %>
               <%
               if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
                  %>
                  <a href="mypage_qna.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
                  <%
               }
               %>
               </td>
            </tr>
    </table>
    
<%@include file="/footer.jsp" %>
</body>
</html>