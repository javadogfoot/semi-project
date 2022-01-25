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
   text-align: center!important;
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

.title{
   color: white; 
   font-size:20px; 
   font-weight: bold; 
   background-color: tomato; 
   height:30px;
   width:200px; 
   padding:10px; 
   text-align:center;
   margin: 0px;
}

.enddate{
   text-align:right;
}
.l_name{
   font-size: 35px;
   text-align: eft;
   font-weight:bold;
}
.l_title{
   font-size:15px;
   text-align: left;
}
.l_people{
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
   border: 0px solid tomato;
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

#joinbtn4{
   background-color:white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none; tomato;
}
meter {
	width: 250px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
MemberDTO mdto=ldao.selectAllm(m_id); 
ldao.lessonOk();

/**비회원 리스트 접속시, 모든 지역 레슨리스트 보이게*/
/**전체 레슨 페이징*/
int totalCnt=0;
if(m_id==null||m_id.equals("")||m_id.equals("admin")){
		totalCnt=ldao.getTotalCnt();
}else{
		totalCnt=ldao.getTotalCnt(mdto.getM_addr());
}
int listSize=5;
int pageSize=3;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
/**------------------------------------------------------------*/
/**인기 레슨 페이징*/
int pop_totalCnt=0;
if(m_id==null||m_id.equals("")||m_id.equals("admin")){
	pop_totalCnt=ldao.getPopularTotalCnt();
}else{
	pop_totalCnt=ldao.getPopularTotalCnt(mdto.getM_addr());
}
int pop_listSize=1;
int pop_pageSize=1;

String pop_cp_s=request.getParameter("pop_cp");
if(pop_cp_s==null||pop_cp_s.equals("")){
	pop_cp_s="1";
}
int pop_cp=Integer.parseInt(pop_cp_s);

int pop_totalPage=(pop_totalCnt/pop_listSize)+1;
if(pop_totalCnt%pop_listSize==0)pop_totalPage--;

int pop_userGroup=pop_cp/pop_pageSize;
if(pop_cp%pop_pageSize==0)pop_userGroup--;
%>
<section>
	<article>
	<%
	String userAddr;
	if(m_id==null||m_id.equals("")||m_id.equals("admin")){ 
		userAddr="전체지역";
	}else{
		userAddr=mdto.getM_addr();
	}
	%>
		<h3 style="color:tomato; text-align:left;"><%=userAddr %> 레슨</h3>  <!-- 마감된 레슨은 인기레슨리스트에서 제외된다. -->
		<div class="title"> <%=userAddr %> 인기레슨</div>
		<br>
		<br>
		<%		
		ArrayList<LessonDTO> pop_arr=null;
		
		if(m_id==null||m_id.equals("")||m_id.equals("admin")){
		pop_arr=ldao.lessonPopularList(pop_cp,pop_listSize);
		}else{
		pop_arr=ldao.lessonPopularList(mdto.getM_addr(),pop_cp,pop_listSize);
		}
		
		if(pop_arr==null||pop_arr.size()==0){
			%>
			<table class="lessonTable" >
				<tr>
					<td align="center">
					현재 등록된 레슨이 없습니다.
					</td>
				</tr>
			</table>
			<%
		}else{
			%>
			<table class="lessonTable">
			<tr>
			<td>
				<%
				if(pop_userGroup!=0){ //이전 화살표
				%>
				<a href="lessonList.jsp?pop_cp=<%=(pop_userGroup-1)*pop_pageSize+pop_pageSize%>" class="joinbt" >&lt;&lt;</a>
				<%
				}else{
				%>
				<a href="lessonList.jsp?pop_cp=<%=pop_totalCnt%>" class="joinbt">&lt;&lt;</a>
				<%
				}
				%>
				</td>
				<%
				for(int i=0;i<pop_arr.size();i++){
				%><%-- <td style="position:relative; opacity:0.9;"><a href="lessonContent.jsp?l_idx=<%=pop_arr.get(i).getL_idx()%>"> --%>
				<td><a href="lessonContent.jsp?l_idx=<%=pop_arr.get(i).getL_idx()%>">
				<ul>
					<li class="enddate">
						<div><%=pop_arr.get(i).getL_enddate() %></div> <!-- 마감일 -->
						<div style="color:tomato; font-weight:bold; font-size:20px;">D-<%=ldao.lessonDDay(pop_arr.get(i).getL_idx()) %></div></li>
					<li class="l_name"><%=pop_arr.get(i).getL_name() %></li><br> <!-- 레슨명 -->
					<li ><label id="joinbtn4">작성자</label>
					&nbsp;&nbsp;<span><%=pop_arr.get(i).getM_name()%>(<%=pop_arr.get(i).getM_id() %>)</span></li><br><!-- 작성자 문제 -->
					<li ><label id="joinbtn4">한줄소개</label>
					&nbsp;&nbsp;<span><%=pop_arr.get(i).getL_con().length() >= 25?
							pop_arr.get(i).getL_con().substring(0, 25)+".....":pop_arr.get(i).getL_con() %></span></li><br><br>
					<li class="l_people"><label id="joinbtn4">모집인원</label>
					<meter min="0" max="<%=pop_arr.get(i).getL_people()%>" value="<%=pop_arr.get(i).getM_idxcnt()%>"></meter>
					&nbsp;&nbsp;&nbsp;<%=pop_arr.get(i).getM_idxcnt() %>/<%=pop_arr.get(i).getL_people()%>
					<%if( pop_arr.get(i).getL_people() ==  pop_arr.get(i).getM_idxcnt()+1){%>
					&nbsp;&nbsp;&nbsp;<span style="position:absolute; font-size:16px; color:gray; font-weight:bold;">딱 한자리 남았어요~</span >
					<%
					}else if(pop_arr.get(i).getL_people() ==  pop_arr.get(i).getM_idxcnt()){
					%>
					&nbsp;&nbsp;&nbsp;<span style="position:absolute; font-size:16px; color:gray; font-weight:bold;">신청인원이<br>마감되었어요!</span >
					<%}else{%>
					&nbsp;&nbsp;&nbsp;<span></span >
					<%} %></li>
				</ul>
				</a></td>
				<%} %>
				<td>
				<%
				if(pop_userGroup!=(pop_totalPage/pop_pageSize)-(pop_totalPage%pop_pageSize==0?1:0)){  //다음 화살표
				%>
				<a href="lessonList.jsp?pop_cp=<%=(pop_userGroup+1)*pop_pageSize+1 %>" class="joinbt">&gt;&gt;</a>
				<%
				}else{
				%>
				<a href="lessonList.jsp?pop_cp=1" class="joinbt">&gt;&gt;</a>
				<%
				}
				%>	
				</td>
				</tr>
		</table>
		<br><br>
				<%
		}
		%>
		<br>
		<hr>
		<br>
		<br>
	</article>
	
	<article id="searchBar">
	<form name="lessonSearch" action="lessonSearch.jsp">
		<select name="searchKey">
			<option value="l_name||l_con">전체</option><!-- l_name컬럼과 l_name컬럼 2개를 불러올 수 있다. -->
			<option value="l_name">레슨명</option>
			<option value="l_con">레슨설명</option>
		</select>
		<%if(m_id==null||m_id.equals("")){	
		}else{%>
			<input type="hidden" name="m_addr" value="<%=mdto.getM_addr()%>">
		<%}%>
		<input type="text" name="searchValue" size="30">
		<input type="submit" value="검색" class="joinbt">
	</form>
	</article>
	<br>
	<br>
	<article>
		<div class="title"><%=userAddr %> 전체레슨</div>
		<br>
		<br>
		<%
		ArrayList<LessonDTO> arr=null;
		if(m_id==null||m_id.equals("")||m_id.equals("admin")){
			arr=ldao.lessonList(cp,listSize);
		}else{
			arr=ldao.lessonList(mdto.getM_addr(),cp,listSize);
		}
		if(arr==null||arr.size()==0){
			%>
			<table class="lessonTable">
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
		<table class="lessonTable" >
		<tr>
			<td><a href="lessonContent.jsp?l_idx=<%=arr.get(i).getL_idx()%>">
				<ul>
					<li class="enddate">
					<div><%=arr.get(i).getL_enddate() %></div> <!-- 마감일 -->
					<div style="color:tomato; font-weight:bold; font-size:20px;">D-<%=ldao.lessonDDay(arr.get(i).getL_idx()) %></div></li>
					<li class="l_name"><%=arr.get(i).getL_name() %></li><br>
					<li ><label id="joinbtn4">작성자</label>
					&nbsp;&nbsp;<span><%=arr.get(i).getM_name()%>(<%=arr.get(i).getM_id() %>)</span></li><br><!-- 작성자 문제 -->
					<li ><label id="joinbtn4">한줄소개</label>
					&nbsp;&nbsp;<span><%=arr.get(i).getL_con().length()>=25?
					arr.get(i).getL_con().substring(0, 25)+"...":arr.get(i).getL_con() %></span></li><br><br>
					<li class="l_people"><label id="joinbtn4">모집인원</label>
					<meter  min="0" max="<%=arr.get(i).getL_people()%>" value="<%=arr.get(i).getM_idxcnt()%>"></meter>	
					&nbsp;&nbsp;<%=arr.get(i).getM_idxcnt() %>/<%=arr.get(i).getL_people()%>
					<%if( arr.get(i).getL_people() ==  arr.get(i).getM_idxcnt()+1){%>
					&nbsp;&nbsp;&nbsp;<span style="position:absolute; font-size:16px; color:gray; font-weight:bold;">딱 한자리 남았어요~</span >
					<%
					}else if(arr.get(i).getL_people() ==  arr.get(i).getM_idxcnt()){
					%>
					&nbsp;&nbsp;&nbsp;<span style="position:absolute; font-size:16px; color:gray; font-weight:bold;">신청인원이<br>마감되었어요!</span >
					<%}else{%>
					&nbsp;&nbsp;&nbsp;<span></span >
					<%} %></li>
				</ul>
				</a></td></tr></table>
		<br><br>
		
		<%
			}
		}
		%>
		<div style="text-align: center;">
		<%
			if(userGroup!=0){ //이전 화살표
		%>
			<a href="lessonList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>"><img alt="/tomato/img/leftBt.png" src="l버튼"></a>
		<%
			}
		%>
		<%     //시작페이지*5+1
			for(int i=userGroup*3+1;i<=userGroup*pageSize+pageSize;i++){  //페이지 만들기
		%>
			&nbsp;&nbsp;<a href="lessonList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
		<% //cp파라미터로 인위적으로 이동
				if(i==totalPage){
				break;
				}
			}
	 	%>
		<%
			if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){  //다음 화살표
		%>
			<a href="lessonList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
		<%
			}
		%>	
		</div>
		<div style="text-align: right;">
		<a href="lessonUpload.jsp"><input type="button" value="레슨 등록하기" class="joinbt"></a>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>