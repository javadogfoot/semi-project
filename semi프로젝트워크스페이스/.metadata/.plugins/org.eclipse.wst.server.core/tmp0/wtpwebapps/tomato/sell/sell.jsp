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
   background: #f5f4f0;
   font-family: 'Roboto';
}
.signup-form {
   width: 500px;
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

table{
   width: 500px;
   margin: 0px auto;
   margin-bottom: 10px;
}

table td{
   padding: 8px;
}

input, select{
   height: 23px;
}

table th{
   padding-right: 25px;
   padding-bottom: 10px;
   font-size: 18px;
   text-align: right;
}

#sellBtn1{
   background-color: lightgray;
   color: black;
   font-weight: bold;
   height: 23px;
   margin: 2px;
   border: 2px solid lightgray;
}

#sellBtn2{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}

#sellBtn2:hover{
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
<script type="text/javascript">
function checkForm(){
	var form=document.sell;
	var regExpPrice=/^[0-9]{1,10}$/;
	/**제품 이름 유효성검사*/
	if(form.s_name.value==null||form.s_name.value==""){
		alert('제품 이름을 입력해주세요.');
		form.s_name.focus();
		return false;
	}else if(form.s_name.value.length<3||form.s_name.value.length>12){
		alert('제품 이름은 3-12글자 이내로 입력가능합니다.');
		form.s_name.focus();
		return false;
	}
	/**가격 유효성 검사*/
	if(form.s_price.value==""||form.s_price.value==null){
		alert('제품 가격을 입력해주세요.');
		form.s_price.focus();
		return false;
	}else if(!regExpPrice.test(form.s_price.value)){
		alert('제품 가격은 숫자만 입력가능하며 1,000,000,000까지 설정가능합니다.');
		form.s_price.select();
		return false;
	}
	/**카테고리 유효성 검사*/
	if(form.s_cate.value==""||form.s_cate.value==null){
		alert('품목을 선택해주세요.');
		form.s_cate.select();
		return false;
	}
	/**제품 설명 유효성 검사*/
	if(form.s_con.value==""||form.s_con.value==null){
		alert('제품 설명을 입력해주세요.');
		form.s_con.focus();
		return false;
	}else if(form.s_con.value.length<15||form.s_con.value.length>500){
		alert('제품 설명은 15-500글자 이내로 입력가능합니다.');
		form.s_con.select();
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
	location.href='/tomato/index.jsp';
	</script>
	<% 
	return;
}
%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"/>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"/>
<%
/**sell/upload/폴더 안 session에 저장된 m_id폴더 유무 확인 후 생성*/
sdao.setUserid(m_id);
String m_addr=mdao.findAddr(m_id);
sdao.sellFolderExist();
String cp=request.getParameter("cp");
if(cp==null||cp.equals("")){
	cp=m_id;
}
sdao.setCrpath(cp);
/**m_id을 이용해 MemberDAO에서 m_idx추출(SELL테이블과 접점)*/
int m_idx=mdao.selectMidx(m_id);
%>
<section>
	<article>
	<div class="signup-form">
		<h3>SELL</h3>
		<form name="sell" action="sell_ok.jsp" method="post" accept-charset="utf-8">
		<input type="hidden" name="m_idx" value="<%=m_idx %>">
		<input type="hidden" name="m_id" value="<%=m_id %>">
		<input type="hidden" name="s_addr" value="<%=m_addr %>">
			<table>
				<tr>
					<th><label>제품명</label></th>
					<td>
					<input type="text" name="s_name" placeholder="제품명">
					</td>
				</tr>
				<tr>
					<th><label>가격</label></th>
					<td><input type="text" name="s_price" placeholder="가격">&nbsp;원</td>
				</tr>
				<tr>
					<th><label>품목</label></th>
					<td>
					<select name="s_cate">
						<option value="" selected disabled hidden>==선택하세요==</option>
						<option value="디지털기기">디지털기기</option>
						<option value="생활가전">생활가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="유아동">유아동</option>
						<option value="생활/가공식품">생활/가공식품</option>
						<option value="유아도서">유아도서</option>
						<option value="스포츠/레져">스포츠/레저</option>
						<option value="여성잡화">여성잡화</option>
						<option value="여성의류">여성의류</option>
						<option value="남성패션/잡화">남성패션/잡화</option>
						<option value="게임/취미">게임/취미</option>
						<option value="뷰티/미용">뷰티/미용</option>
						<option value="반려동물용품">반려동물용품</option>
						<option value="도서/티켓/음반">도서/티켓/음반</option>
						<option value="식물">식물</option>
						<option value="기타중고물품">기타중고물품</option>
					</select>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: text-top;"><label>제품 설명</label></th>
					<td><textarea name="s_con" cols="40" rows="10" placeholder="게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있습니다.)"></textarea></td>
				</tr>
			</table>
			<div style="text-align:center;">
				<input type="button" value="판매하기" id="sellBtn2" onclick="checkForm();">
			</div>
		</form>
			<br/>
			<br/>
	</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>