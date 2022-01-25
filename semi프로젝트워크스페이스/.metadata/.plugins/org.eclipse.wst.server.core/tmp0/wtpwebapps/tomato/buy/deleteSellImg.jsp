<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdto" class="tomato.sell.SellDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<%
String imgPath=request.getParameter("imgPath");
String delImgPort=request.getParameter("delImgPort");
String filePort=request.getParameter("filePort");
String m_id=request.getParameter("m_id");
File f=new File(delImgPort);
Boolean result=sdao.deleteImg(f);
if(!result){
	%>
	<script>
	window.alert('사진 삭제가 불가능합니다.');
	location.href='/tomato/buy/buyContent.jsp?s_idx=<%=sdto.getS_idx()%>';
	</script>
	<%
	return;
}else{
	File f2=new File(filePort);
	File files[]=f2.listFiles();
	String filePath="";
	String middlePath="/"+m_id+"/"+sdto.getS_idx()+"/";
	if(files.length==1){
		filePath=sdao.IMAGE_ROOT+middlePath+files[0].getName();
	}else{
		for(int i=0;i<files.length;i++){
			if(i!=files.length-1){
				filePath=filePath+(sdao.IMAGE_ROOT+middlePath+files[i].getName()+", ");
			}
			else if(i==files.length-1){
				filePath=filePath+(sdao.IMAGE_ROOT+middlePath+files[i].getName());
			}
		}
	}
	sdao.updateImg(sdto.getS_idx(), filePath);
}
%>
<script>
location.href='/tomato/buy/buyContent.jsp?s_idx=<%=sdto.getS_idx()%>';
</script>
