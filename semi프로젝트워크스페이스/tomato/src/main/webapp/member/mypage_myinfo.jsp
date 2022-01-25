<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tomato.member.*" %>
<%@ page import="java.util.*" %>
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
      background: #f5f5f5;
      font-family: 'Roboto';
}
.signup-form{
      width: 390px;
      margin: 0 auto;
      padding: 30px 0;
}
.signup-form h3{
      color: dimgray;
      font-size: 40px;
      margin: 0 0 15px;
      text-align: center;
   }
li{
   list-style-type: none;
   text-align:center;
   text-color:red;
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
      font-weight: normal;
      font-size: 13px;
}
.signup-form .input-group-addon {
      max-width: 42px;
      text-align: center;
      background: none;
      border-width: 0 0 1px 0;
      padding-left: 5px;
}
.signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
      background: #19aa8d;
        border-radius: 3px;
      border: none;
      min-width: 140px;
        outline: none !important;
   }
.signup-form .btn:hover, .signup-form .btn:focus {
      background: #179b81;
}
#joinbtn1{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn1:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn2{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn2:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn3{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn3:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#joinbtn4{
   background-color:white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   
   border: none; tomato;
}

</style>
<script>
   
   function changeForm(val){
      if(val=="0"){
         location.href='/tomato/member/memberUpdate.jsp';
      }else{
         location.href='/tomato/member/memberDelete_ok.jsp';
         }   
      }

</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
   <article>
   <div class="signup-form">
   <h3>MY PAGE</h3>
   <form name="mypage" action="memberUpdate_ok.jsp">
   <p class="lead">[회원정보는 개인정보처리방침에 따라 <br> 안전하게 보호됩니다.]</p>
   <div class="form-group">
   <div class="input-group">
   
      <br>
               <% 
               MemberDTO dto=mdao.memberView(m_id);
               
               %>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">아이디</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_id() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">이름</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_name() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">주소</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_addr() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">이메일</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_email() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">전화번호</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_tel() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">생년월일</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_birth() %>
                  </div>
                  </div>
                  <div class="form-group">
                  <div class="input-group">
                  <label id="joinbtn4">가입날짜</label>
                  <span class="input-group-addon"></span>
                  <%=dto.getM_joindate() %>
                  </div>
                  </div>
            <br/>
         <div style="text-align:center;">
            <input type="button" value="회원정보 변경" id="joinbtn2" onclick="changeForm(0)">
            <input type="button" value="회원탈퇴" id="joinbtn3"onclick="changeForm(1)">
         </div>
         </div>
         </div>
         </form>
         </div>
      <br/>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>