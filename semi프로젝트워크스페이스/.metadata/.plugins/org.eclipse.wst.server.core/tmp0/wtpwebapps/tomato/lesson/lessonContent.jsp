<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="tomato.lesson.*" %>
<%@ page import="tomato.lesson_re.*" %>
<jsp:useBean id="ldao" class="tomato.lesson.LessonDAO" scope="session"></jsp:useBean>
<jsp:useBean id="lrdao" class="tomato.lesson_re.LessonReDAO"></jsp:useBean>
<%
   String idx_s=request.getParameter("l_idx");
   if(idx_s==null||idx_s.equals("")){
      idx_s="0";
   }
   
   int l_idx=Integer.parseInt(idx_s);
   LessonDTO dto=ldao.lessonContent(l_idx);
   
   if(dto.getL_del()==1){
	   %>
	   <script>
	   window.alert('존재하지 않는 게시물입니다.');
	   window.history.back();
	   </script>
	   <%
   }
   else if(dto.getL_del()==1){
	   %>
	   <script>
	   window.alert('존재하지 않는 게시물입니다.');
	   window.history.back();
	   </script>
	   <%
	}

%>
<!DOCTYPE html>
<html>
<head>
<script>
function reReWriteBox(l_r_idx){   
   var replyDom=document.getElementById(l_r_idx).nextElementSibling;
   var display=replyDom.style.display;
   
   if(display=='none'){
      replyDom.style.display='block';
   }else{
      replyDom.style.display='none';
   }
}
</script>
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
article{
   width: 750px;
   margin: 0px auto;
   padding:15px;
}
.joinbt{
   text-align: right;
   background-color: white;
   color: tomato;
   font-weight: bold;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
   text-decoration: none;
}
.joinbt:hover{
   background-color: tomato;
   color: white;
   height:23px;
   border: none;
   margin:2px;
   border: 2px solid tomato;
   text-decoration: none;
}
.reply1{
   width: 650px;
   margin: 0 auto;
}
.reply1 ul{
   list-style: none;
}
.reply1 ul li{
   margin: 10px 0;
}
.reList{
   width: 650px;
   margin: 0 auto;
}
ul{
   list-style: none;
}
.reList ul li{
   margin: 15px 0;
</style>

</head>
<body>
<%@include file="/header.jsp" %>
<%

int m_idx=ldao.selectMidx(m_id);

int reTotalCnt=lrdao.getReTotalCnt(l_idx);
/*레슨 댓글 리스트*/
int listSize=15;
int pageSize=5;
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
   cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=(reTotalCnt/listSize)+1;
if(reTotalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<section>
   <article>
   <br>
   <br>
   <form name="lessonContent" action="lessonJoin_ok.jsp">
   <span style="font-size:40px;"><%=dto.getL_name() %></span>
   <span style="float: right;">
      <%
      if(m_idx==dto.getM_idx()){ //본문과 접속자가 일치 || 관리자가 접속
      %>
         <input type="button" value="삭제하기"  onclick="location.href='lessonDel_ok.jsp?l_idx=<%=dto.getL_idx()%>&l_name=<%=dto.getL_name()%>'" class="joinbt">&nbsp;
         <input type="button" value="수정하기" onclick="location.href='lessonUpdate.jsp?l_idx=<%=dto.getL_idx()%>'" class="joinbt">
      <%
      }else if(m_idx==1){
      %>
         <input type="button" value="삭제하기"  onclick="location.href='lessonDel_ok.jsp?l_idx=<%=dto.getL_idx()%>&l_name=<%=dto.getL_name()%>'" class="joinbt">
      <%
      }else{
      %>
         <input type="hidden" name="l_idx" value="<%=dto.getL_idx()%>">
         <input type="hidden" name="lm_idx" value="<%=dto.getM_idx() %>">
         <input type="hidden" name="m_idx" value="<%=m_idx%>">
         <%if(dto.getL_people() ==  dto.getM_idxcnt()){ %>
            <input type="button" value="신청인원마감" class="joinbt">
         <%}else{ %>
            <input type="submit" value="신청하기" class="joinbt">
         <%} %>
         &nbsp;<input type="button" value="신청취소" class="joinbt" onclick="location.href='lessonJoinCancle_ok.jsp?l_idx=<%=dto.getL_idx()%>&lm_idx=<%=dto.getM_idx()%>&m_idx=<%=m_idx %>'">
      <%
      }
      %>
      </span>
      <hr>
         <p align="left" style="word-break:break-all; height:300px;">         
            설명:&nbsp;<%if(dto.getL_con()!=null){ %>       <!-- 20자 이상 쓰게 유효성7 -->
            <%=dto.getL_con().replaceAll("\n", "<br>") %>
            <%} %>
         </p>
         <hr>
   </form>
   </article>
   <article>
   <%ArrayList<LessonReDTO> arr=lrdao.lessonReList(l_idx,cp,listSize);%>
   <!-- 댓글 입력창 -->
      <form name="lessonReWrite" action="lessonReWrite_ok.jsp">
      <div class="reply1">
         <ul>
            <li>
               <%
               if(arr==null||arr.size()==0){
               %>
                  <label style="font-weight: bold;">댓글</label>&nbsp;<label style="font-weight:bold;color:teal;">0</label>
               <%
               }else{
               %>
                  <label style="font-weight: bold;">댓글</label>&nbsp;<label style="font-weight:bold;color:teal;"><%=reTotalCnt %></label>
               <%
               }
               %>
            </li>
               <%
               String msg;
               String readStatus;
               if(m_idx==0){
                  msg="댓글은 회원만 작성 가능합니다.";
                  readStatus="readonly";
               }else{
                  msg="댓글을 입력하세요.";
                  readStatus="";
               }
               %>
            <li>
               <textarea name="l_r_con" placeholder="<%=msg %>" cols="80" rows="4" <%=readStatus %>></textarea>
               <input type="hidden" name="l_idx" value="<%=l_idx %>">
               <input type="hidden" name="m_idx" value="<%=m_idx %>">
               <input type="submit" value="입력하기" class="joinbt" >
            </li>
         </ul>
      </div>
   </form>
   <hr>
   <ul>
      <% if(arr==null||arr.size()==0){%>
         <li>등록된 댓글이 없습니다.</li>
      <%}else{
         for(int i=0;i<arr.size();i++){
      %>
   <br>
      <li id="<%=arr.get(i).getL_r_idx()%>">
      <%
      for(int k=0;k<arr.get(i).getL_r_lev();k++){
      out.println("&nbsp;&nbsp;");
      }
      %>
         <span style="font-weight: bold; width: 120px;"><%=arr.get(i).getM_name()%>(<%=arr.get(i).getM_id() %>)</span>&nbsp;&nbsp;
         <span style="font-size:13px;"><%=arr.get(i).getL_r_joindate() %></span>
         <span><input type="button" value="답변" onclick="reReWriteBox('<%=arr.get(i).getL_r_idx()%>');" 
            style="border:0px; color: tomato;font-weight:bold; background-color: white;float:right;"></span>
      <% if(m_idx==arr.get(i).getM_idx()||m_idx==1){%>
         <span><a href="lessonReDel_ok.jsp?l_r_idx=<%=arr.get(i).getL_r_idx()%>&l_idx=<%=l_idx%>">
            <input type="button" value="삭제" style="border:0px; color: tomato;font-weight:bold; background-color: white;float:right;" ></a></span>
      <%} %>
         <span style="word-break:break-all;"><%=arr.get(i).getL_r_con().replaceAll("\n", "<br>") %></span>
      </li>
   <!-- 대댓글입력창 -->
      <li class="replyDom" style="display:none;">
         <form name="lessonReReWrite" action="lessonReReWrite_ok.jsp">
            <textarea name="l_r_con" placeholder="<%=msg %>" cols="80" rows="4" <%=readStatus %>></textarea>
            <input type="hidden" name="l_idx" value="<%=l_idx %>">
            <input type="hidden" name="m_idx" value="<%=m_idx %>">
            <input type="hidden" name="l_r_ref" value="<%=arr.get(i).getL_r_ref() %>">
            <input type="hidden" name="l_r_lev" value="<%=arr.get(i).getL_r_lev() %>">
            <input type="hidden" name="l_r_sunbun" value="<%=arr.get(i).getL_r_sunbun() %>">
            <input type="submit" value="입력하기" class="joinbt">
         </form>
      </li>
         <%
         }
      }
      %>
   </ul>
      
      <div style="text-align: center;">
      <%
         if(userGroup!=0){ //이전 화살표
      %>
         <a href="lessonContent.jsp?l_idx=<%=l_idx %>&cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
      <%
         }
      %>
         <%
         for(int k=userGroup*5+1;k<=userGroup*pageSize+pageSize;k++){
         %>
         &nbsp;&nbsp;<a href="lessonContent.jsp?l_idx=<%=l_idx %>&cp=<%=k%>"><%=k%></a>&nbsp;&nbsp;
         <%   
         if(k==totalPage){
            break;
            }
         }
         %>
         <%
         if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){  //다음 화살표
      %>
         <a href="lessonContent.jsp?l_idx=<%=l_idx %>&cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
      <%
         }
      %>   
      </div>
      
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>