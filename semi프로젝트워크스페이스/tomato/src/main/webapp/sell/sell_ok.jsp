<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdto" class="tomato.sell.SellDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"></jsp:useBean>
<%
/**상품 등록 후 해당 상품에 대한 s_idx값(sequence) 얻어옴 
CURRVAL의 경우 NEXTVAL 이후 바로 실행*/
int result=sdao.sellProduct(sdto);
if(result<0){
	%>
	<script>
	window.alert('제품 등록에 실패하였습니다.');
	location.href='sell.jsp';
	</script>	
	<%
}
String id=request.getParameter("m_id");
if(id==null){
	%>
	<script>
	window.alert('입력시간이 초과되었습니다. 저장된 데이터는 마이페이지에서 수정 가능합니다.');
	location.href='/tomato/index.jsp';
	</script>
	<%
	return;
}
%>
<script>
window.alert('상품 등록이 완료되었습니다. 사진을 선택해주세요.');
</script>
<%
String path=id+"/"+result;
sdao.setUserid(path);
sdao.sellFolderExist();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<script>
/**새로고침시 해당 정보 DB에 이중등록되어 새로고침을 막아놓음 */
function noRefresh(){
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } 
    else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))  {
        return false;
    }
}
document.onkeydown = noRefresh;
</script>
</head>
<style>
body {
   background: #f5f4f0;
   font-family: 'Roboto';
}

table{
   width: 700px;
   margin: 0px auto;
   margin-bottom: 10px;
}

table td{ 
   padding-bottom: 10px;
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

#sellBtn{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#sellBtn:hover{
   background-color: tomato;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
.fileBtn{
   background-color: white;
   color: dimgray;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid teal;
}
</style>
<script>
/**창을 불러올 때 upload1,2,3,4 모두 보이지 않게 처리*/
function fileSet(){
	document.getElementById("file2").style.display="none";
	document.getElementById("file3").style.display="none";
	document.getElementById("file4").style.display="none";
	document.getElementById("file5").style.display="none";
}
/**file2 보이게 설정(upload1의 값이 채워져 있을 시에만 실행)*/
function file2Visible(){
	if(!document.getElementById("upload1").value==""){
		document.getElementById("file2").style.display="block";
	}else{
		window.alert('파일을 선택해주세요.');
	}
}
/**file2 보이지 않게 설정(해당 파일에 첨부된 사진도 삭제됨.)*/
function file2inVisible(){
	document.getElementById("upload2").value="";
	document.getElementById("file2").style.display="none";
}
/**file3 보이게 설정(upload1,2의 값이 채워져 있으며 각 파일의 이름이 다를 경우 실행)*/
function file3Visible(){
	var filename1=document.getElementById("upload1").value;
	var filename2=document.getElementById("upload2").value;
	if(filename1==filename2){
		window.alert('동일한 파일명의 이미지는 올릴 수 없습니다.');
	}else if(filename1==null||filename2==null){
		window.alert('파일을 선택해주세요.');
	}else{
		document.getElementById("file3").style.display="block";
	}
}
/**file3 보이지 않게 설정(해당 파일에 첨부된 사진도 삭제됨.)*/
function file3inVisible(){
	document.getElementById("upload3").value="";
	document.getElementById("file3").style.display="none";
}
/**file4 보이게 설정(upload1,2,3의 값이 채워져 있으며 각 파일의 이름이 다를 경우 실행)*/
function file4Visible(){
	var filename1=document.getElementById("upload1").value;
	var filename2=document.getElementById("upload2").value;
	var filename3=document.getElementById("upload3").value;
	if(filename1==filename2||filename1==filename3||filename2==filename3){
		window.alert('동일한 파일명의 이미지는 올릴 수 없습니다.');
	}else if(filename1==null||filename2==null||filename3==null){
		window.alert('파일을 선택해주세요.');
	}else{
		document.getElementById("file4").style.display="block";
	}
}
/**file4 보이지 않게 설정(해당 파일에 첨부된 사진도 삭제됨.)*/
function file4inVisible(){
	document.getElementById("upload4").value="";
	document.getElementById("file4").style.display="none";
}
/**file5 보이게 설정(upload1,2,3,4의 값이 채워져 있으며 각 파일의 이름이 다를 경우 실행)*/
function file5Visible(){
	var filename1=document.getElementById("upload1").value;
	var filename2=document.getElementById("upload2").value;
	var filename3=document.getElementById("upload3").value;
	var filename4=document.getElementById("upload4").value;
	if(filename1==filename2||filename1==filename3||filename1==filename4||filename2==filename3||filename2==filename4||filename3==filename4){
		window.alert('동일한 파일명의 이미지는 올릴 수 없습니다.');
	}else if(filename1==null||filename2==null||filename3==null||filename4==null){
		window.alert('파일을 선택해주세요.');
	}else{
		document.getElementById("file5").style.display="block";
	}
}
/**file5 보이지 않게 설정(해당 파일에 첨부된 사진도 삭제됨.)*/
function file5inVisible(){
	document.getElementById("upload5").value="";
	document.getElementById("file5").style.display="none";
}
</script>
<body onload="fileSet()">
<%@include file="/header.jsp" %>
<section>
	<article>
	<div class="signup-form">
	<h3>SELL</h3>
	<!--file이 저장된 multipart/form-data의 경우 form의 input 태그를 통한 parameter 전달 불가능 --- -->
	<!--path의 경우 사용자의 아이디폴더 안의 상품번호(sequence)폴더로 설정- -->
		<form name="sellImg" action="sellImg_ok.jsp?path=<%=path %>&s_idx=<%=result %>" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th><label>제품명</label></th>
				<td><%=request.getParameter("s_name") %></td>
			</tr>
			<tr>
				<th><label>가격</label></th>
				<td><%=request.getParameter("s_price") %></td>
			</tr>
			<tr>
				<th><label>품목</label></th>
				<td><%=request.getParameter("s_cate") %></td>
			</tr>
			<tr>
				<th><label>제품 설명</label></th>
				<td style="word-break:break-all;"><%=request.getParameter("s_con").substring(0,15) %>...</td>
			</tr>
			<tr>
				<th><label>제품 사진</label></th>
				<td>
				<div id="file1">
					<input type="file" name="upload1" id="upload1" required="required" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
					<input type="button" value="+" onclick="file2Visible()" class="fileBtn">
				</div>
				<div id="file2">
					<input type="file" name="upload2" id="upload2" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
					<input type="button" value="+" onclick="file3Visible()" class="fileBtn">
					<input type="button" value="-" onclick="file2inVisible()" class="fileBtn">
				</div>
				<div id="file3">
					<input type="file" name="upload3" id="upload3" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
					<input type="button" value="+" onclick="file4Visible()" class="fileBtn">
					<input type="button" value="-" onclick="file3inVisible()" class="fileBtn">
				</div>
				<div id="file4">
					<input type="file" name="upload4" id="upload4" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
					<input type="button" value="+" onclick="file5Visible()" class="fileBtn">
					<input type="button" value="-" onclick="file4inVisible()" class="fileBtn">
				</div>
				<div id="file5">
					<input type="file" name="upload5" id="upload5" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
					<input type="button" value="-" onclick="file5inVisible()" class="fileBtn">
				</div>
				<h6 style="display:inline;">.jpg, .png .jpeg만 가능</h6>
				</td>
			</tr>
		</table>
		<div style="text-align:center;">
				<input type="submit" value="등록하기" id="sellBtn">
			</div>
		</form>
	</div>	
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>