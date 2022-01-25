<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO" scope="session"></jsp:useBean>
<%
String savePath=sdao.USERS_HOME+sdao.getCrpath();
sdao.sellFolderExist();
int filesize=10*1024*1024;
try{
	MultipartRequest mr=
			new MultipartRequest(request, savePath, filesize, "utf-8");
}catch(Exception e){
	%>
	<script>
	window.alert('업로드 실패');
	window.self.close();
	</script>
	<%
	return;
}
File f=new File(savePath);
File files[]=f.listFiles();
String filePath="";
if(files.length==1){
	filePath=sdao.IMAGE_ROOT+"/"+sdao.getCrpath()+"/"+files[0].getName();
}else{
	for(int i=0;i<files.length;i++){
		if(i!=files.length-1){
			filePath=filePath+(sdao.IMAGE_ROOT+"/"+sdao.getCrpath()+"/"+files[i].getName()+", ");
		}
		else if(i==files.length-1){
			filePath=filePath+(sdao.IMAGE_ROOT+"/"+sdao.getCrpath()+"/"+files[i].getName());
		}
	}
}
int result=sdao.updateImg(sdao.getSellIdx(), filePath);
String msg=result>0?"등록되었습니다.":"다시 실행해주세요.";
%>
<script>
window.alert('업로드 성공');
opener.location.reload();
//opener.location.reload(); --> 가장 쉬운 방법
window.self.close();
</script>
