<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*" %>
<%@ page import="tomato.sell.*" %>
<jsp:useBean id="sdao" class="tomato.sell.SellDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tomato/css/mainLayout.css">
<style>
#joinbtn1{
   background-color: navy;
   color: white;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
#joinbtn1:hover{
   background: #f5f4f0;
   color: navy;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
}
.sidebar {
font-size : 3px;
font-weight : bold;
height: 500px;
width: 200px;
color: #999;
background: #f5f4f0;
}
.sidebar a {
padding: 15px 16px 15px 16px;
text-decoration: none;
font-size: 10pt;
color: navy;
display: block;
border: 1px bold tomato;
}
.sidebar a:hover {
color: tomato;
}
form {
   text-align : center;
}
h3{
   text-align: center;
}
li {
   list-style-type: none;
}
h4 {
   text-align: center;
   margin: 0px auto;
}
aside { 
   width:200px; 
   float:left;
}
fieldset{
   margin: 0px auto;
   width: 700px;
   text-align: center;
}
   table.table tr th, table.table tr td {
       border-color: #e9e9e9;
       width: 770px;
       text-align: center;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
       background-color: #fcfcfc;
   }
   table.table-striped.table-hover tbody tr:hover {
      background: #f5f5f5;
   }
   table.table td a {
      font-weight: bold;
      color: #566787;
      display: inline-block;
      text-decoration: none;
      outline: none !important;
</style>
<script>
function showListAll(){
   location.href='buyListAll_admin.jsp?col=s_idx&range=desc';
}
function checkForm(){
	   var form=document.keywordFind;
	   /**글 제목 유효성검사*/
	   if(form.keyword.value==null||form.keyword.value==""){
	      alert('키워드를 입력해주세요.');
	      form.keyword.focus();
	      return false;
	   }
	   form.submit();
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<%
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int totalCnt=sdao.getAdminTotalCnt();

int listSize=20;
int pageSize=10;

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

String col=request.getParameter("col");
String range=request.getParameter("range");
%>
<aside>
<div class="sidebar" style="position:absolute;">
<div></div><a href="memberList_admin.jsp">회원목록 보러가기</a>
<div></div><a href="buyList_admin.jsp">상품목록 보러가기</a>
<div></div><a href="lessonList_admin.jsp">레슨목록 보러가기</a>
<div></div><a href="communityList_admin.jsp">커뮤니티목록 보러가기</a>
<div></div><a href="qnaList_admin.jsp">큐엔에이목록 보러가기</a>
</div>
</aside>
<section>
      <h3>[상 품 판 매 글 조 회]</h3>
</section>
<section>
   <form name="keywordFind" method="post">
      <input type="text" name="keyword" placeholder="키워드를 입력해주세요" size="50">
      <input type="button" value="검색" id="joinbtn1" onclick="checkForm()">
      <input type="button" name="listAll" value="모두보기" id="joinbtn1" onclick="showListAll()">
   </form>
</section>
<section>
      <%
      if(request.getMethod().equals("GET")){
         %>
</section>
       <article>
        <h2>상품 <b>목록</b></h2>
    <table class="table table-striped table-hover" style="margin-left:200px;">
         <thead>
            <tr>
               <th>글번호</th>
               <th>상품이름</th>
               <th>상품가격</th>
               <th>카테고리</th>
               <th>상품설명</th>
            </tr>
         </thead>
         <tbody>
            <%
            ArrayList<SellDTO> arr=sdao.adminSellList(cp, listSize, col, range);;
            if(arr==null||arr.size()==0){
               %>
               <tr>
                  <td colspan="5" align="center">
                  등록된 상품판매글이 없습니다.
                  </td>
               </tr>
               <%
            }else {
               for(int i=0;i<arr.size();i++){
                  String sellStatus=arr.get(i).getS_sellok()==0?"[판매중]":"[판매완료]";
                  %>
                  <tr>
                    <td><%=arr.get(i).getS_idx() %></td>             
                    <td><a href="/tomato/buy/buyContent.jsp?s_idx=<%=arr.get(i).getS_idx() %>"><%=sellStatus%>&nbsp;<%=arr.get(i).getS_name() %></a></td>             
                    <td><%=arr.get(i).getS_price() %></td>             
                    <td><%=arr.get(i).getS_cate() %></td>             
                    <td><%=arr.get(i).getS_con().substring(0,10) %>...</td>             
                 </tr>
                  <%
               }
            }
            %>
           </tbody>
           <tfoot>
           		<tr>
					<td colspan="4" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="buyListAll_admin.jsp?cp=1&col=s_idx&range=desc">%lt;&lt;</a>
						<a href="buyListAll_admin.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>&col=s_idx&range=desc">&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
						String clickedPage=cp==i?"clicked":"unclicked";
						%><label class="<%=clickedPage%>">
						&nbsp;&nbsp;<a href="buyListAll_admin.jsp?cp=<%=i %>&col=s_idx&range=desc"><%=i %>
						</a>&nbsp;&nbsp;</label>
						<%
						if(i==totalPage){
							break;
						}
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="buyListAll_admin.jsp?cp=<%=(userGroup+1)*pageSize+1 %>&col=s_idx&range=desc">&gt;</a>
						<a href="buyListAll_admin.jsp?cp=<%=totalPage %>&col=s_idx&range=desc">&gt;&gt;</a>
						<%
					}
					%>
					</td>
				</tr>
          </tfoot>
        </table>
        </article>
         <%
      }else {
         %>
         <jsp:include page="buyKeywordFind_ok.jsp"></jsp:include>
         <%
      }
      %>

<%@include file="/footer.jsp" %>
</body>
</html>