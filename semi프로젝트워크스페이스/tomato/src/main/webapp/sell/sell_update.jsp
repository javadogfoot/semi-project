<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tomato.sell.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO" scope="session"></jsp:useBean>
<%
String s_idx_s=request.getParameter("s_idx");
if(s_idx_s==null||s_idx_s.equals("")){
	%>
	<script>
	window.alert('수정할수 없는 게시물입니다.');
	location.href='/tomato/index.jsp';
	</script>
	<%
	return;
}
int s_idx=Integer.parseInt(s_idx_s);
SellDTO dto=sdao.updateSellList(s_idx);
if(dto==null){
	%>
	<script>
	window.alert('수정할 수 없는 게시물입니다.');
	location.href='/tomato/index.jsp';
	</script>
	<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
</head>
<script>
document.sellupdate.s_cate.value=<%=dto.getS_cate()%>;
document.sellupdate.s_addr.value=<%=dto.getS_addr()%>;
function checkForm(){
	var form=document.sellupdate;
	var regExpPrice=/^[0-9]{1,10}$/;
	/**제품 이름 유효성검사*/
	if(form.s_name.value==null||form.s_name.value==""){
		alert('제품 이름을 입력해주세요.');
		form.s_name.focus();
		return false;
	}else if(form.s_name.value.length<5||form.s_name.value.length>15){
		alert('제품 이름은 5-12글자 이내로 입력가능합니다.');
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
	}else if(form.s_con.value.length<10||form.s_con.value.length>500){
		alert('제품 설명은 10-500글자 이내로 입력가능합니다.');
		form.s_con.select();
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

h3{
   text-align: center;
   font-size: 40px;
   color: tomato;
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

.signup-form label {
   font-size: 13px;
   background-color: white;
   color: tomato;
   font-weight: bold;
   height: 23px;
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
.title{
   text-align: center;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<div class="signup-form">
	<h3>제품 정보 수정</h3>
		<form name="sellupdate" action="sell_update_ok.jsp">
		<input type="hidden" name="s_idx" value="<%=dto.getS_idx() %>">
 			<table>
				<tr>
					<th><label>제품명</label></th>
					<td><input type="text" name="s_name" value="<%=dto.getS_name() %>"></td>
				</tr>
				<tr>
					<th><label>가격</label></th>
					<td><input type="text" name="s_price" value="<%=dto.getS_price()%>"></td>
				</tr>
				<tr>
					<th><label>품목</label></th>
					<td>
						<select name="s_cate">
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
				<%
				String m_addr=mdao.findAddr(m_id);
				if(dto.getS_addr().equals(m_addr)){
					%>
					<tr>
						<th><label>주소</label></th>
						<td><input type="text" name="s_addr" value="<%=dto.getS_addr()%>" readonly></td>
					</tr>
					<%
				}else{
					%>
					<tr>
					<th><label>주소</label></th>
						<td>
						<select name="s_addr">
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
						</td>
					</tr>
					<%	
				}
				%>
				<tr>
					<th><label>제품 설명</label></th>
					<td><textarea name="s_con" cols="40" rows="10"><%=dto.getS_con()%></textarea></td>
				</tr>
				<tr>
					<th><label>판매현황</label></th>
					<td>
						<select name="s_sellok">
							<option value="0">거래중</option>
							<option value="1">거래완료</option>
						</select>
					</td>
				</tr>
			</table>
			<div style="text-align:center;">
				<input type="button" value="수정하기" id="sellBtn2" onclick="checkForm();">
			</div>
		</form>
	</div>	
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>