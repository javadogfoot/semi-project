<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tomato.member.MemberDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String userid=request.getParameter("m_id");
String userpwd=request.getParameter("m_pwd");
String saveid=request.getParameter("saveid");

int result=mdao.loginCheck(userid, userpwd);
if(result==mdao.LOGIN_OK){
   String dbname=mdao.getUserInfo(userid);
   session.setAttribute("m_id", userid);
   session.setAttribute("m_name", dbname);
   
   if(saveid==null){
	   Cookie ck=new Cookie("saveid", userid);
	   ck.setMaxAge(0);
	   response.addCookie(ck);
   }else{
	   Cookie ck=new Cookie("saveid", userid);
	   ck.setMaxAge(60*60*24*30);
	   response.addCookie(ck);
   }
   %>
   <script>
   window.alert('로그인 성공!');
   location.href='/tomato/index.jsp';
   </script>
   <%
}else if(result==mdao.NOT_ID||result==mdao.NOT_PWD){
   %>
   <script>
   window.alert('로그인 실패!');
   location.href='/tomato/member/login.jsp';
   </script>
   <%
}
%>