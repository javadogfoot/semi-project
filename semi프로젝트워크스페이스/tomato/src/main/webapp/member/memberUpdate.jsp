<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tomato.member.*" %>

<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>

<%
String id = (String) session.getAttribute("m_id");
MemberDTO dto=mdao.memberView(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script type="text/javascript">
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
	   var form=document.memberUpdate;
	   var regExpId=/^[a-z|A-Z|0-9]/;
	   var regExpPwd=/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	   var regExpName=/^[가-힣|A-Z|a-z]{2,10}$/;
	   var regExpEmail=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	   var regExpTel=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
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
	   form.submit();
	 }
</script>
<style>
body {
		background: #f5f4f0;
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
		height:23px;
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
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
   <article>
   <div class="signup-form">
      <h3>Change my Info</h3>
      <form name="memberUpdate" method="post" action="memberUpdate_ok.jsp" accept-charset="utf-8">
      <input type="hidden" name="id" value="<%=id%>">
    <p class="lead">변경하실 내용을 수정해주세요!</p>
	<div class="form-group">
	<div class="input-group">
	<br>
          <div class="form-group">
		  <div class="input-group">
			<label>아이디</label>
			<span class="input-group-addon"></span>
            <input readonly="readonly" type="text" class="form-control" name="m_id" height="10" value="<%=dto.getM_id() %>" >
          </div>
		  </div>
		  
            <div class="form-group">
		  	<div class="input-group">
				<label>비밀번호</label>
					<span class="input-group-addon"></span>
             		<input type="password" class="form-control" name="m_pwd" placeholder="비밀번호"  id="pwd"
             		onchange="pwdCheckMsg()" >
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
			<label>이름</label>
			<span class="input-group-addon"></span>
             <input readonly="readonly" type="text" class="form-control" name="m_name" value="<%=dto.getM_name() %>">
             </div>
		     </div>
          
             <div class="form-group">
		  	<div class="input-group">
			<label>주소</label>
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
			<label>이메일</label>
			<span class="input-group-addon"></span>
             <input type="text" class="form-control" name="m_email" value="<%=dto.getM_email() %>">
             </div>
		     </div>
		     
             <div class="form-group">
		  	<div class="input-group">
			<label>전화번호</label>
			<span class="input-group-addon"></span>
             <input type="text" class="form-control" name="m_tel" value="<%=dto.getM_tel()%>">
             </div>
		     </div>
          <br>
  			<div style="text-align: center;">
                <input type="button" id="joinbtn1" value="수정하기" onclick="checkForm();">
                <input type="reset" id="joinbtn1" value="다시작성">
			</div>          	
          </div>
        </div>
    </form>
    </div>
 </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>