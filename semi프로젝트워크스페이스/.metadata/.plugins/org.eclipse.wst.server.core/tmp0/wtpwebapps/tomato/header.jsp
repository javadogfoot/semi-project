<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#btn1{
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
}
#btn1:hovertn1{
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
<body>
<header>
<%
String m_id=(String)session.getAttribute("m_id");
String m_name=(String)session.getAttribute("m_name");
if(m_id==null){
   %>
   <div>
   <a href="/tomato/member/login.jsp">로그인</a> | <a href="/tomato/member/join.jsp">회원가입</a>
   </div>
   <% 
}else{
      %>
   <div>
   <%
   if(m_id.equals("admin")){
      %>
      <a href="/tomato/admin/memberList_admin.jsp"><%=m_name %>님 마이페이지</a> |
      <%
   }else{
      %>
      <a href="/tomato/member/mypage.jsp"><%=m_name %>님 마이페이지</a> |
      <%
   }
   %>
   <a href="/tomato/member/logout.jsp">로그아웃</a>
   </div>
   <%
}
%>
<nav>
<ul>
   <li><h1><a href="/tomato/index.jsp"><img src="/tomato/img/토마토_메인로고.png" alt="메인로고" height="50px" width="250px"></a></h1></li>
   <li><h2><a href="/tomato/sell/sell.jsp">SELL</a></h2></li>
   <li><h2><a href="/tomato/buy/buyList.jsp?col=s_idx&range=desc">BUY</a></h2></li>
   <li><h2><a href="/tomato/lesson/lessonList.jsp">LESSON</a></h2></li>
   <li><h2><a href="/tomato/community/community.jsp">COMMUNITY</a></h2></li>
   <li><h2><a href="/tomato/qna/qnaList.jsp">Q&A</a></h2></li>
   <li>
		<form name="headerSearch" action="/tomato/buy/headerBuySearch.jsp" style="display: inline;">
			<input type="text" name="searchValue" placeholder="상품을 검색하세요">
			<input type="submit" value="검색" id="btn1">
		</form>
	</li>
</ul>
</nav>
<hr/>
</header>
</body>
</html>