<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.lesson.*" %>
<%@ page import="tomato.member.*" %>
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

h3{
   text-align: center;
   font-size: 40px;
   color: tomato;
}

.lessonTable {
   background-color:white;
   border:1px solid tomato;
   width: 750px;
   margin: 0px auto;
   padding:15px;   
}

.lessonTable a{ 
   text-decoration: none;
}

.lessonTable a:link ,.lessonTable a:visited ,.lessonTable a:hover{ 
    color: #000;
    text-decoration: none;
 }

li{
   list-style: none;
}
table{
   border: 0px solid tomato;
   width: 750px;
   margin: 0px auto;
   padding:15px;
}

.enddate{
   text-align: right;
}
.l_name{
   font-size: 20px;
   text-align: left;
}
.l_title{
   font-size:15px;
   text-align: left;
}
.l_bar{
   text-align:center;
}
#searchBar{
   text-align:center;
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
<body>
<%@include file="/header.jsp" %>
<section>
   <article>
   <h3>검색 결과</h3>
      <%
      
      String searchKey=request.getParameter("searchKey");
      String searchValue=request.getParameter("searchValue");
      String m_addr= request.getParameter("m_addr");
      
      ArrayList<LessonDTO> arr=null;
      
      if(m_id==null||m_id.equals("")||m_id.equals("admin")){
      arr=ldao.lessonSearch(searchKey,searchValue);
      }else{
      arr=ldao.lessonSearch(searchKey,searchValue,m_addr);
      }
      
      if(arr==null||arr.size()==0){
         %>
         <table>
            <tr>
               <td align="center">
               현재 등록된 레슨이 없습니다.
               </td>
            </tr>
         </table>
         <%
      }else{
      for(int i=0;i<arr.size();i++){
      %>
      <table class="lessonTable">
         <tr>
            <td><a href="lessonContent.jsp?l_idx=<%=arr.get(i).getL_idx()%>">
            <ul>
               <li class="enddate"><%=arr.get(i).getL_enddate() %></li><!-- 마감일 -->
               <li class="l_name"><label>레슨명</label>
               &nbsp;&nbsp;&nbsp;<%=arr.get(i).getL_name() %>
               <%if(arr.get(i).getL_lessonok()==1){%>
               레슨 마감
               <%}%>
               </li><br>
               <li class="l_name"><label>작성자</label>
               &nbsp;&nbsp;&nbsp;<%=arr.get(i).getM_name()%>(<%=arr.get(i).getM_id() %>)</li><br><!-- 작성자 문제 -->
               <li class="l_title"><label>클래스소개</label>
               &nbsp;&nbsp;&nbsp;<%=arr.get(i).getL_con().length()>=10?
               arr.get(i).getL_con().substring(0, 10)+"...":arr.get(i).getL_con() %></li><br><br>
               <li class="l_bar"><label>모집인원</label>
               <%//int joinCnt=ldao.getJoinTotalCnt(arr.get(i).getL_idx()); %>
               <meter min="0" max="<%=arr.get(i).getL_people()%>" value="<%=arr.get(i).getM_idxcnt()%>"></meter>   
               &nbsp;&nbsp;&nbsp;<%=arr.get(i).getM_idxcnt() %>/<%=arr.get(i).getL_people()%></li>
            </ul></a></td>
         </tr>
      </table>
      <br><br>
      <%
         }
      }
      %>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>