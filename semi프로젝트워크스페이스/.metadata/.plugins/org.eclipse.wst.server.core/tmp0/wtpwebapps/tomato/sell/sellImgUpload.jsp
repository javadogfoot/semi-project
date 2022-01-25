<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
<form name="sellImgUpload" action="sellImgUpload_ok.jsp" 
method="post" enctype="multipart/form-data">
<fieldset>
	<legend>사진올리기</legend>
	<input type="file" name="upload1" id="upload" required="required" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
	<input type="submit" value="파일 올리기">
</fieldset>
</form>
</body>
</html>