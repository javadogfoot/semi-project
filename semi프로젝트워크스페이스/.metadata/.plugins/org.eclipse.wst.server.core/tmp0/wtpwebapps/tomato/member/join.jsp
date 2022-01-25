<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script type="text/javascript">
function popupIdCheck(){
   window.open('idCheck.jsp', 'idCheck', 'width=450, height=200');
}
function pwdCheckMsg(){
   var pwd=document.getElementById("pwd").value;
   var pwdCheck=document.getElementById("pwdCheck").value;
   var msg;
   if(pwd==''&&pwd==''){
      msg='';
   }else{
      if(pwd==pwdCheck){
         msg='일치';
      }else{
         msg='불일치';
      }   
   }
   document.getElementById("msg").innerHTML=msg;
}
function checkForm(){
   var form=document.join;
   var regExpId=/^[a-z|A-Z|0-9]/;
   var regExpPwd=/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
   var regExpName=/^[가-힣|A-Z|a-z]{2,10}$/;
   var regExpEmail=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   var regExpTel=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
   /**아이디 유효성검사*/
   if(form.m_id.value==""||form.m_id==null){
      alert('아이디를 입력해주세요.');
      form.m_id.focus();
      return false;
   }else if(form.m_id.value.length<6||form.m_id.value.length>12){
      alert('아이디는 6~12글자 이내로 입력가능합니다.');
      form.m_id.select();
      return false;
   }else if(!regExpId.test(form.m_id.value)){
      alert('아이디는 영문 대/소문자와 숫자만 입력가능합니다.');
      form.m_id.select();
      return false;
   }
   /**비밀번호 유효성검사*/
   if(form.m_pwd.value!=form.m_pwdCheck.value){
      alert('비밀번호가 일치하지 않습니다.');
      form.m_pwd.focus();
      return false;
   }else if(form.m_pwd.value==""||form.m_pwd==null){
      alert('비밀번호를 입력해주세요.');
      form.m_pwd.focus();
      return false;
   }else if(!regExpPwd.test(form.m_pwd.value)){
      alert('비밀번호는 숫자와 소문자, 특수문자를 모두 포함하여 8자 이상 입력가능합니다.');
      form.m_pwd.select();
      return false;
   }
   /**이름 유효성검사*/
   if(form.m_name.value==""||form.m_name==null){
      alert('이름를 입력해주세요.');
      form.m_name.focus();
      return false;
   }else if(!regExpName.test(form.m_name.value)){
      alert('이름은 문자만 입력가능합니다.');
      form.m_pwd.select();
      return false;
   }
   /**이메일 유효성검사*/
   if(form.m_email.value==""||form.m_email==null){
      alert('이메일을 입력해주세요.');
      form.m_email.focus();
      return false;
   }else if(!regExpEmail.test(form.m_email.value)){
      alert('이메일을 확인해주세요.');
      form.m_email.select();
      return false;
   }
   /**주소 유효성검사*/
   if(form.m_addr.value==""||form.m_addr.value==null){
      alert('주소를 선택해주세요.');
      form.m_addr.focus();
      return false;
   }
   /**전화번호 유효성검사*/
   if(form.m_tel.value==""||form.m_tel.value==null){
      alert('전화번호를 입력해주세요.');
      form.m_tel.focus();
      return false;
   }else if(!regExpTel.test(form.m_tel.value)){
      alert('전화번호를 확인해주세요.');
      form.m_tel.select();
      return false;
   }
   /**생년월일 유효성검사(2020년생까지만)*/
   if(form.m_birth.value==""||form.m_birth.value==null){
      alert('생년월일을 선택해주세요.');
      form.m_birth.focus();
      return false;
   }
   var year=form.m_birth.value.substring(0,4)*1;
   if(year>=2021){
      alert('생년월일을 확인해주세요.');
      fomr.m_birth.focus();
      return false;
   }
   /**질문 유효성검사*/
   if(form.m_ask.value==""||form.m_ask.value==null){
      alert('질문을 선택해주세요.');
      form.m_ask.focus();
      return false;
   }
   /**질문 답변 유효성 검사*/
   if(form.m_answer.value==""||form.m_answer.value==null){
		  alert('답변을 입력하세요.');
		  form.m_answer.focus();
		  return false;
	   }
   form.submit();
}

</script>
<style>
body {
      font-family: 'Roboto';
      background: #f5f4f0;
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
.signup-form .form-control {
      min-height: 38px;
      box-shadow: none !important;
      border-width: 0 0 1px 0;
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
.signup-form a {
      color: #19aa8d;
      text-decoration: none;
}   
.signup-form a:hover {
      text-decoration: underline;
}
.signup-form .fa {
      font-size: 21px;
}
.signup-form .fa-paper-plane {
      font-size: 17px;
}
.signup-form .fa-check {
      color: #fff;
      left: 9px;
      top: 18px;
      font-size: 7px;
      position: absolute;
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
#msg{
   font-size: 13px;
   color: orangered;
   font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
   <article>
   <div class="signup-form">
   <h3>회 원 가 입</h3>
      <form name="join" method="post" action="join_ok.jsp" accept-charset="utf-8">
      <p class="lead">나만의 계정을 만들고 <br>토마토마켓의 다양한 혜택을 받으세요!</p>
      <div class="form-group">
      <div class="input-group">
         <label>아이디 </label>
            <span class="input-group-addon"></span>
            <input type="text" class="form-control" name="m_id" readonly placeholder="아이디" height="10">
            <input type="button" value="확인" onclick="popupIdCheck()" id="joinbtn1">
         </div>
        </div>
      <div class="form-group">
      <div class="input-group">
         <label>비밀번호 </label>
            <span class="input-group-addon"></span>
            <input type="password" class="form-control" name="m_pwd" placeholder="비밀번호"  id="pwd"
               onchange="pwdCheckMsg()">
         </div>
        </div>
      <div class="form-group">
      <div class="input-group">
         <label>비밀번호 확인 </label>
            <span class="input-group-addon">
               <i class="fa fa-lock"></i>
               <i class="fa fa-check"></i>
            </span>
            <input type="password" class="form-control" name="m_pwdCheck" placeholder="비밀번호 확인" onchange="pwdCheckMsg()" id="pwdCheck">
               &nbsp;<span id="msg"></span>
         </div>
        </div>      
        <div class="form-group">
           <div class="input-group">
           <label>이름 </label>
            <span class="input-group-addon"></span>
            <input type="text" class="form-control" name="m_name" placeholder="이름" >
         </div>
        </div> 
        <div class="form-group">
      <div class="input-group">
            <label>이메일</label>
            <span class="input-group-addon"></span>
            <input type="email" class="form-control" name="m_email" placeholder="이메일">
         </div>
        </div>
        <div class="form-group">
      <div class="input-group">
         <label>주소 </label>
               <select name="m_addr">
                  <option value="" selected disabled hidden>==선택하세요==</option>
                  <option value="강남구">강남구</option>
                  <option value="강동구">강동구</option>
                  <option value="강북구">강북구</option>
                  <option value="강서구">강서구</option>
                  <option value="관악구">관악구</option>
                  <option value="광진구">광진구</option>
                  <option value="구로구">구로구</option>
                  <option value="금천구">금천구</option>
                  <option value="노원구">노원구</option>
                  <option value="도봉구">도봉구</option>
                  <option value="동대문구">동대문구</option>
                  <option value="동작구">동작구</option>
                  <option value="마포구">마포구</option>
                  <option value="서대문구">서대문구</option>
                  <option value="서초구">서초구</option>
                  <option value="성동구">성동구</option>
                  <option value="성북구">성북구</option>
                  <option value="송파구">송파구</option>
                  <option value="양천구">양천구</option>
                  <option value="영등포구">영등포구</option>
                  <option value="용산구">용산구</option>
                  <option value="은평구">은평구</option>
                  <option value="종로구">종로구</option>
                  <option value="중랑구">중랑구</option>
               </select>
            <span class="input-group-addon"></span>
         </div>
        </div>
        
        <div class="form-group">
      <div class="input-group">
         <label>전화번호 </label>
            <span class="input-group-addon"></span>
            <input type="text" class="form-control" name="m_tel" placeholder="전화번호">
         </div>
        </div>
        <div class="form-group">
      <div class="input-group">
         <label>생년월일 </label>
            <span class="input-group-addon"></span>
            <input type="date" class="form-control" name="m_birth">
         </div>
        </div>
        <div class="form-group">
      <div class="input-group">
         <label>본인 확인 질문 </label>
            <span class="input-group-addon"></span>
            <select name="m_ask">
            <option value="" selected diabled hidden>==선택하세요==</option>
            <option value="가장 기억에 남는 장소는?">가장 기억에 남는 장소는?</option>
            <option value="가장 좋아하는 노래 제목은?">가장 좋아하는 노래 제목은?</option>
            <option value="반려동물의 이름은?">반려동물의 이름은?</option>
            <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
            </select>
         </div>
        </div>
        <div>
        <label>본인 확인 답변</label>
         <input type="text" name="m_answer" placeholder="본인 확인 답변">
        </div> 
         <br>
         <br>
         <br>
         <tr>
            <td colspan="2" align="center">
            SMS 수신동의&nbsp;&nbsp;<input type="checkbox" name="m_smsok" value="1" checked>&nbsp;&nbsp;
            <input type="hidden" name="m_smsok" value="0">
            EMAIL 수신동의&nbsp;&nbsp;<input type="checkbox" name="m_emailok" value="1" checked>
            <input type="hidden" name="m_emailok" value="0">
            </td>
            </tr><br>
        <div style="text-align: center;">
            <input type="button" value="가입하기" id="joinbtn2" onclick="checkForm()">
            <input type="reset" value="다시작성" id="joinbtn3">
        </div>
        <br>
        <div class="text-center">이미 계정이 있으신가요? <br> <a href="login.jsp">여기서 로그인하세요!</a>
        </div>
</form>
</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
</html>