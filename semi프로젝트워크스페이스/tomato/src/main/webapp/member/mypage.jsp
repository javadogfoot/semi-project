<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="tomato.member.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdto" class="tomato.member.MemberDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
body {
   color: #999;
   background: #f5f4f0;
   font-family: 'Roboto';
}

.signup-form {
   width: 390px;
   margin: 0 auto;
   padding: 30px 0;
}

.signup-form h3 {
   color: dimgray;
   font-size: 40px;
   margin: 0 0 15px;
   text-align: center;
}

.signup-form .lead {
   font-size: 14px;
   margin-bottom: 30px;
   text-align: center;
}

.signup-form form {
   border-radius: 1px;
   margin-bottom: 15px;
   background: #fff;
   border: 1px solid #f3f3f3;
   box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
   padding: 30px;
}

.signup-form .form-group {
   margin-bottom: 20px;
}

.signup-form label {
   font-size: 13px;
   background-color: white;
   color: tomato;
   font-weight: bold;
   height: 23px;
}

.signup-form .input-group-addon {
   max-width: 42px;
   text-align: center;
   background: none;
   border-width: 0 0 1px 0;
   padding-left: 5px;
}

#joinbtn1 {
   background: #f5f4f0;
   color: tomato;
   font-weight: bold;
   height: 23px;
   margin: 2px;
   border: none;
}

#joinbtn1:hover {
   background-color: tomato;
   color: white;
   font-weight: bold;
   height: 23px;
   margin: 2px;
   border: none;
  }

#joinbtn2 {
   background-color: white;
   color: #fff;
   font-size: 13px;
   font-weight: bold;
   height: 30px;
   margin: 2px;
   border: none;
}

.main_menu>li:hover .sub_menu {
   height: 160px;
   transition: 0.4s;
   z-index: 999;
}

.container::after {
   display: block;
   content: '';
   clear: both;
}

aside {
   float: left;
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
  	  }else if(val=="6"){
         location.href='/tomato/member/mypage_lesson.jsp';
      }else if(val=="7"){
    	  location.href='/tomato/member/mypage_sell.jsp';
      }
 }
</script>

</head>
<body>
   <%@include file="/header.jsp"%>
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
   <section>
      <article>
         <div class="signup-form">
            <h3>MY PAGE</h3>
            <form name="mypage" action="memberUpdate_ok.jsp">
               <p class="lead">
                  [회원정보는 개인정보처리방침에 따라 <br> 안전하게 보호됩니다.]
               </p>
               <div class="form-group">
                  <div class="input-group">
                     <br>
                     <%
                     MemberDTO dto = mdao.memberView(m_id);
                     %>
                     <div class="form-group">
                        <div class="input-group">
                           <label>아이디</label> <span class="input-group-addon"></span>
                           <%=dto.getM_id()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>이름</label> <span class="input-group-addon"></span>
                           <%=dto.getM_name()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>주소</label> <span class="input-group-addon"></span>
                           <%=dto.getM_addr()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>이메일</label> <span class="input-group-addon"></span>
                           <%=dto.getM_email()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>전화번호</label> <span class="input-group-addon"></span>
                           <%=dto.getM_tel()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>생년월일</label> <span class="input-group-addon"></span>
                           <%=dto.getM_birth()%>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <label>가입날짜</label> <span class="input-group-addon"></span>
                           <%=dto.getM_joindate()%>
                        </div>
                     </div>
                     <br />
                     <div style="text-align: center;">
                        <input type="button" value="회원정보 변경" id="joinbtn1"
                           onclick="changeForm(0)"> <input type="button"
                           value="회원탈퇴" id="joinbtn1" onclick="changeForm(1)">
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <br />
      </article>
   </section>
   <%@include file="/footer.jsp"%>
</body>
</html>