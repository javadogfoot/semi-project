<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<%
/**받아온 path : 사용자 m_id/s_idx*/
String path=request.getParameter("path");
sdao.setCrpath(path);
String savePath=sdao.USERS_HOME+"/"+sdao.getCrpath();
int filesize=10*1024*1024;
try{
	MultipartRequest mr=
			new MultipartRequest(request, savePath, filesize, "utf-8");
}catch(Exception e){
	%>
	<script>
	window.alert('업로드 실패');
	</script>
	<%
}
File f=new File(savePath);
File files[]=f.listFiles();
String filePath="";
/**s_idx폴더에 저장된 모든 값 불러들여 경로 나열 /tomato/sell/upload/m_id/s_idx/의 파일들*/
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

String s_idx_s=request.getParameter("s_idx");
int s_idx=Integer.parseInt(s_idx_s);
/**해당 파일 경로들 update*/
int result=sdao.updateImg(s_idx, filePath);
String msg=result>0?"등록되었습니다.":"다시 실행해주세요.";
%>
<script>
window.alert('<%=msg%>');
location.href='/tomato/index.jsp';
</script>
