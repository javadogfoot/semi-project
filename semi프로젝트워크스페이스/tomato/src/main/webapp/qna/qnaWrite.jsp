					<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
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
body {
   background: #f5f4f0;
   font-family: 'Roboto';
}

.signup-form {
   width: 550px;
   margin: 0 auto;
   padding: 30px 0;
}

.signup-form h3 {
   color: tomato;
   font-size: 40px;
   margin: 0 0 15px;
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

h3{
   text-align: center;
}
table{
   border-spacing: 0 20px;
   margin: 0px auto;
}
</style>
</head>
<script>
function checkForm(){
   var form=document.qnaWrite;
   /**글 제목 유효성검사*/
   if(form.q_sub.value==null||form.q_sub.value==""){
      alert('질문 제목을 입력해주세요.');
      form.q_sub.focus();
      return false;
   }else if(form.q_sub.value.length<5){
      alert('질문 제목을 5글자 이상 입력해주세요.');
      form.q_sub.focus();
      return false;
   }
   /**글 내용 유효성검사*/
   if(form.q_con.value==null||form.q_con.value==""){
      alert('질문 내용을 입력해주세요.');
      form.q_con.focus();
      return false;
   }else if(form.q_con.value.length<1||form.q_con.value.length>1000){
      alert('질문 내용을 1000자 이내로 입력해주세요.');
      form.q_con.focus();
      return false;
   }
   form.submit();
}
</script>
<body>
<%@include file="/header.jsp" %>
<%
   if(m_id==null||m_id.equals("")){
      %>
      <script>
      window.alert('로그인 후 이용 가능한 서비스입니다.');
      location.href='/tomato/qna/qnaList.jsp';
      </script>
      <%
      return;
      }
%>
<section>
   <article>
   <div class="signup-form">
      <h3>질문하기</h3>
      <form name="qnaWrite" action="qnaWrite_ok.jsp">
      <table>
         <tr>
            <th>제목</th>
            <td><input type="text" name="q_sub" size="48" style="border: 1px solid; border-radius: 4px"></td>
         </tr>
         
         <tr>
            <th style= "vertical-align: text-top">내용</th>
            <td><textarea rows="10" cols="50" name="q_con" style="border-radius: 8px"></textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
            <input type="button" value="작성하기" id="joinbtn1" onclick="checkForm()">
            <input type="reset" value="다시작성" id="joinbtn1">
            </td>
         </tr>
      </table>
      </form>
      </div>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>