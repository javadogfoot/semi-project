<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
body {
      font-family: 'Roboto';
      background: #f5f4f0;
}
.login-form{
      width: 390px;
      margin: 0 auto;
      padding: 30px 0;
}
.login-form h3{
      color: dimgray;
      font-size: 40px;
      margin: 0 0 15px;
      text-align: center;
}
.login-form form {      
      border-radius: 1px;
       margin-bottom: 15px;
        background: #fff;
      border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
}
.login-form .form-group {
      margin-bottom: 20px;
}
.login-form label {
      font-weight: normal;
      font-size: 13px;
}
.login-form .form-control {
      min-height: 38px;
      box-shadow: none !important;
      border-width: 0 0 1px 0;
}
.login-form .input-group-addon {
      max-width: 42px;
      text-align: center;
      background: none;
      border-width: 0 0 1px 0;
      padding-left: 5px;
}
#loginbtn1{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#loginbtn1:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
</style>
</head>
<%
Cookie cks[]=request.getCookies();
String saveid="";
if(cks!=null){
   for(int i=0;i<cks.length;i++){
      if(cks[i].getName().equals("saveid")){
         saveid=cks[i].getValue();         
      }
   }
}
%>
<body>
<%@include file="/header.jsp" %>
   <section>
      <article>
      <div>
      <div class="login-form">
      <h3> 로 그 인 </h3>
        
           <form name="login.jsp" method="post" action="login_ok.jsp">
           <div class="form-group">
         <div class="input-group">
              <label>아이디</label>
                 <span class="input-group-addon"></span>
                 <input type="text" class="form-control" name="m_id" id="<%=saveid %>">
           </div>
           </div>
      <div class="form-group">
      <div class="input-group">      
              <label>비밀번호</label>  
                 <span class="input-group-addon"></span>
                 <input type="password" class="form-control" name="m_pwd">
                 <input type="submit" value="로그인" id="loginbtn1">
           </div>
           </div>
              <tr>
              <div class="text-center">
               <td colspan="2" align="center">
               <a href="find_IdPwd.jsp">아이디 찾기 | 비밀번호 찾기</a><br>
                    <a href="join.jsp">회원가입</a>
                    </td>
                    </div>
                    </tr>
        
           <div style="text-align:right;">
              <input type="checkbox" name="saveid" value="on"
              <%=saveid.equals("")?"":"checked" %>>ID기억하기
           </div>
           </form>
      </article>
   </section>
<%@include file="/footer.jsp" %>
</body>
</html>