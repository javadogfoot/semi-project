<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script>
   function popuppwdCheck(){
      window.open('pwdCheck', 'pwdCheck', 'width=450, height=200');
      
   }
function findId(){
location.href      
}
</script>
<style>
body {
	background: #f5f4f0;
      font-family: 'Roboto';
}
h3{
    text-align: center;
    color: dimgray;
    font-size: 25px;
 } 
.title{
    text-align: center;
 }
 .sub_tit{
     font-size: 20px;
     line-height: 28px;
     letter-spacing: -0.45px;
     color: #424242;
     margin-bottom: 15px;
 }
 .id_box{
     position: relative;
 }
 section ul{
     padding-left: 100px;
 }
 .id_box ul::after{
     display: block;
     content: '';
     clear:both;
 }
 .id_box ul li{
   list-style-type: none;
}
.id_box ul .label_txt{
    float: left;
    font-weight: bold;
    font-size: 15px;
    line-height: 30px;
    color: #424242;
    width: 120px;
}

.id_box ul .input_box{
    margin-bottom: 15px;
    padding-left: 80px;
    vertical-align: top;
}
.id_box ul .input_txt{
    width:217px;
    height: 30px;
    font-size: 13px;
    line-height: 30px;
    display:inline-block;
    vertical-align: top;
    border: 1px solid #888;
}

.id_box .btn_check{
    position: absolute;
    bottom: 12px;
    left: 450px;
    background: grey;
    border: none;
    outline: none;
    appearance: none;
    -webkit-appearance: none;
    color: #fff;
    padding: 8px;
    font-size: 13px;
    letter-spacing: -0.2px;
    box-sizing: border-box;
    -webkit-box-sizing:border-box

}

.btn_check:hover{
     Color:red;
}
.content_box + .content_box{
    margin-top: 30px;
    border-top: 1px solid #888;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
   <article>
   <h3>아이디 | 비밀번호 찾기</h3>
   <hr/>
   <form name="find_id" method="post" action="find_Id_ok.jsp">
      <div class="content_box">
      <h4 class="sub_tit">아이디 찾기</h4>
         <div class="id_box">
            <ul>
               <li>
                  <label for="id" class="label_txt">이름</label>
                  <div class="input_box">
                  <input type="text" name="m_name" placeholder="이름">
                  </div>
               </li>
               <li>
                  <label for="id" class="label_txt">이메일</label>
                  <div class="input_box">
                  <input type="text" name="m_email" placeholder="이메일">
                  </div>
               </li>
            </ul>
         <input type="submit" class="btn_check" value="아이디 확인">
         </div>
      </div>
   </form>
      <hr/>
      <form name="find_pwd" method="post" action="find_Pwd_ok.jsp">
         <div class="content_box">
         <h4 class="sub_tit">비밀번호 찾기</h4>
          <div class="id_box">
            <ul>
               <li>
                  <label for="id" class="label_txt">이름</label>
                     <div class="input_box">
                  <input type="text" name="m_name" placeholder="이름">
                  </div>
               </li>
               <li>
                  <label for="id" class="label_txt">이메일</label>
                  <div class="input_box">
                  <input type="text" name="m_email" placeholder="이메일">
                  </div>
               </li>
               <li>
                  <label for="id" class="label_txt">확인질문답변</label>
                  <div class="input_box">
                  <input type="text" name="m_answer" placeholder="확인질문 답변">
                  </div>
             </li>
            </ul>
            <input type="submit" class="btn_check">
          </div>
         </div>
      </form>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>