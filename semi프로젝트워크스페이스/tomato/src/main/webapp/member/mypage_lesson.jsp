<%@page import="tomato.lesson.LessonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.lesson_buy.*" %>

<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO"></jsp:useBean>
<jsp:useBean id="lbdao" class="tomato.lesson_buy.LessonBuyDAO"></jsp:useBean>
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
<body>
<%@include file="/header.jsp" %>
<%int m_idx=mdao.selectMidx(m_id); 
%>
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
            <h3>내가 신청한 레슨</h3>
      </div>
            <table class="table table-striped table-hover">
            <thead>
            <tr>
               <th>레슨 번호</th>
               <th>레슨 제목</th>
               <th>레슨 신청일</th>
               <th>상태</th>
            </tr>
             </thead>
              <tbody>
            <%
            ArrayList<LessonDTO> arr = lbdao.lessonMylist(m_idx);
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="4" align="center">
                  신청한 레슨이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  %>
                  <tr>
                    <td><%=arr.get(i).getL_idx() %></td>             
                    <td><a href="/tomato/lesson/lessonContent.jsp?l_idx=<%=arr.get(i).getL_idx() %>"><%=arr.get(i).getL_name() %></a></td>             
                    <td><%=arr.get(i).getL_joindate() %></td>
                 	<td>
                    	<%
                    	String lessonStatus;
                    	if(arr.get(i).getL_del()==1){
                    		lessonStatus="삭제";
                    	}else if(arr.get(i).getL_lessonok()==1){
                    		lessonStatus="레슨종료";
                    	}else{
                    		lessonStatus="모집중";
                    	}
                    	%>
                    	<%=lessonStatus %>
                    </td>
                 </tr>
                  <%
               }
            }
            %>
            </tbody>
   </table>
<%@include file="/footer.jsp" %>
</body>
</html>