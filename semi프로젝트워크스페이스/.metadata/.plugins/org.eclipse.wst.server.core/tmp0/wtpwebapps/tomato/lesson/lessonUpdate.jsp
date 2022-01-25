<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tomato.lesson.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">

<style>
body {
      background: #f5f4f0;
      font-family: 'Roboto';
}
.signup-form {
   width: 600px;
   margin: 0 auto;
   padding: 30px 0;
}

.signup-form h3 {
   color: dimgray;
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

fieldset{
   border: 0px solid tomato;
   width: 450px;
   height: 500px;
   margin: 0px auto;
   padding:15px;
}
table{
   width: 420px;
   height: 500px;
   margin: 0px auto;
   padding-bottom: 10px;
}
table th{
   font-size: 14px;
   text-align: left;
}
table input{
   height: 14px;
   font-size: 14px;
}
select{
   padding: .1em .1em;
}
.joinbt{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
.joinbt:hover{
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
String idx_s=request.getParameter("l_idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int l_idx=Integer.parseInt(idx_s);
LessonDTO dto=ldao.lessonContent(l_idx);

int joinList=ldao.lessonJoinList(l_idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<div class="signup-form">
	<h3>레 슨 수 정</h3>
	<form name="lessonUpdate" action="lessonUpdate_ok.jsp">
	<fieldset>
			<table>
				<tr>
					<th><label>작성자</label></th>
					<td><input type="text" name="m_id" value="<%=dto.getM_name()%>(<%=dto.getM_id()%>)" readonly ></td>
				</tr>
				<tr>
					<th><label>지역</label></th>
					<td><select name="l_addr">
						<option value="<%=dto.getL_addr() %>" selected><%=dto.getL_addr() %></option>
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
					</select></td>
				</tr>
				<tr>
					<th><label>레슨명</label></th>
					<td><input type="text" name="l_name" placeholder="레슨명" height="10" maxlength="20" value="<%=dto.getL_name()%>"></td>
				</tr>
				<tr>
					<th><label>레슨설명</label></th>
					<td><textarea rows="10" cols="30" name="l_con" maxlength="500" id="con"><%=dto.getL_con() %></textarea></td>
				</tr>
				<tr>
					<th><label>마감일</label></th>
					<td><input type="date" name="l_enddate" value="<%=dto.getL_enddate()%>"></td>
				</tr>
				<tr>
					<th><label>인원수</label></th>
					<td><select name="l_people">
						<option value="<%=dto.getL_people() %>" selected><%=dto.getL_people() %></option>
						<%for(int i=1;i<=30;i++){ %>
						<option value="<%=i%>"><%=i %></option>
						<%} %>
					</select></td>
				</tr>
			</table>
		</fieldset>
			<br/>
			<div style="text-align: center;">
				<input type="hidden" name="l_idx" value="<%=l_idx%>">
				<input type="button" value="수정하기" class="joinbt" onclick="checkForm();">
				<input type="reset" value="다시작성" class="joinbt">
				<input type="button" value="취소" class="joinbt" onclick="location.href='lessonContent.jsp?l_idx=<%=dto.getL_idx()%>'">
			</div>
		</form>
		<br/>
		<br/>
	</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
<script>
function checkForm(){
   var form=document.lessonUpdate;
   
   /**레슨명 유효성검사*/
   if(form.l_name.value==""||form.l_name==null){
      alert('레슨명을 입력해주세요.');
      form.l_name.focus();
      return false;
 	}else if(form.l_name.value.length>10){
		alert('레슨명은 10글자 이내로 입력가능합니다.');
		form.l_name.select();
		return false;
 	}
   /**레슨설명 유효성*/
   if(form.l_con.value==""||form.l_con==null){
	  alert('레슨설명을 입력해주세요');
	  form.l_con.focus();
	  return false;
   }else if(form.l_con.value.length<10||form.l_con.value.length>500){
		alert('제품 설명은 10-500글자 이내로 입력가능합니다.');
		form.l_con.select();
		return false;
	}
   /**마감일 유효성*/
   if(form.l_enddate.value==""||form.l_enddate==null){
	   alert('마감일을 설정해주세요');
	   form.l_enddate.focus();
	   return false;
   }
    var now=new Date();
    var year=now.getFullYear();
    var month=now.getMonth()+1;
    var day=now.getDate();
    
    var today=year+'-'+month+'-'+day;
    var enddate=form.l_enddate.value;
	
	if(enddate<=today){
	   alert('마감일은 오늘 이후 날짜부터 가능합니다');
	   form.l_enddate.focus();
	   return false;
   	}
	/**신청인원 유효성*/
	if(form.l_people.value==""||form.l_people==null){
      alert('모집인원을 입력해주세요.');
      form.l_people.focus();
      return false;
	}else if(form.l_people.value<<%=joinList%>){
		alert('이미 신청한 인원보다 적게 변경은 불가능 합니다.');
		form.l_people.focus();
		return false;
	}
	form.submit();
   }
   </script>
</html>