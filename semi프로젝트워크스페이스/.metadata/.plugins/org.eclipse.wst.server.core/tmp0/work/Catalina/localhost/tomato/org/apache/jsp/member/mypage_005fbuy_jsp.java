/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-19 08:48:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import tomato.sell.SellDTO;
import tomato.lesson.LessonDTO;
import java.util.*;
import tomato.lesson_buy.*;

public final class mypage_005fbuy_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/footer.jsp", Long.valueOf(1633071175604L));
    _jspx_dependants.put("/header.jsp", Long.valueOf(1634624681575L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("tomato.lesson_buy");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("tomato.sell.SellDTO");
    _jspx_imports_classes.add("tomato.lesson.LessonDTO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      tomato.sell.SellDAO sdao = null;
      sdao = (tomato.sell.SellDAO) _jspx_page_context.getAttribute("sdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (sdao == null){
        sdao = new tomato.sell.SellDAO();
        _jspx_page_context.setAttribute("sdao", sdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      tomato.buy.BuyDAO bdao = null;
      bdao = (tomato.buy.BuyDAO) _jspx_page_context.getAttribute("bdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (bdao == null){
        bdao = new tomato.buy.BuyDAO();
        _jspx_page_context.setAttribute("bdao", bdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      tomato.member.MemberDAO mdao = null;
      mdao = (tomato.member.MemberDAO) _jspx_page_context.getAttribute("mdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mdao == null){
        mdao = new tomato.member.MemberDAO();
        _jspx_page_context.setAttribute("mdao", mdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tomato/css/mainLayout.css\">\r\n");
      out.write("<style>\r\n");
      out.write("#joinbtn1{\r\n");
      out.write("   background-color: #f5f4f0;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("}\r\n");
      out.write("#joinbtn1:hover{\r\n");
      out.write("   background: #f5f4f0;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("}\r\n");
      out.write(".dropdown-menu {\r\n");
      out.write("   padding: 0 30px;\r\n");
      out.write("   height: 100%;\r\n");
      out.write("   font-size: 15px;\r\n");
      out.write("   text-align: left;\r\n");
      out.write("   color: #333333;\r\n");
      out.write("   line-height: 50px;\r\n");
      out.write("}\r\n");
      out.write(".dropdown-menu>ul {\r\n");
      out.write("   text-align: left;\r\n");
      out.write("   padding-left: 0;\r\n");
      out.write("   float:left;\r\n");
      out.write("}\r\n");
      out.write(".menu1>ul {\r\n");
      out.write("   list-style: none;\r\n");
      out.write("   opacity: 0;\r\n");
      out.write("   visibility: hidden;\r\n");
      out.write("   display: block;\r\n");
      out.write("   -webkit-transition: all 2s;\r\n");
      out.write("   transition: all 2s;\r\n");
      out.write("}\r\n");
      out.write(".menu1:hover>ul {\r\n");
      out.write("   visibility: visible;\r\n");
      out.write("   opacity: 1;\r\n");
      out.write("}\r\n");
      out.write(".menu1 {\r\n");
      out.write("   width: 100%;\r\n");
      out.write("   height: 50px;\r\n");
      out.write("   display: block;\r\n");
      out.write("   overflow: hidden;\r\n");
      out.write("   -webkit-transition: all 2s;\r\n");
      out.write("   transition: all 1s;\r\n");
      out.write("}\r\n");
      out.write(".menu1:hover {\r\n");
      out.write("   height: 250px;\r\n");
      out.write("}\r\n");
      out.write(".ul {\r\n");
      out.write("   list-style: none;\r\n");
      out.write("}\r\n");
      out.write(".ul>.menu2 {\r\n");
      out.write("   text-align: left;\r\n");
      out.write("   font-size: 5px;\r\n");
      out.write("}\r\n");
      out.write("h3{\r\n");
      out.write("   padding: 12px 15px;\r\n");
      out.write("   text-align:center;\r\n");
      out.write("}\r\n");
      out.write("    body {\r\n");
      out.write("      background: #f5f4f0;\r\n");
      out.write("      font-family: 'Varela Round', sans-serif;\r\n");
      out.write("      font-size: 13px;\r\n");
      out.write("   }\r\n");
      out.write("    table.table tr th, table.table tr td {\r\n");
      out.write("        border-color: #e9e9e9;\r\n");
      out.write("      padding: 12px 15px;\r\n");
      out.write("       width: 390px;\r\n");
      out.write("         margin: 0 auto;\r\n");
      out.write("         padding: 30px 0;\r\n");
      out.write("         text-align:center;\r\n");
      out.write("    }\r\n");
      out.write("    table.table-striped tbody tr:nth-of-type(odd) {\r\n");
      out.write("       background-color: #fcfcfc;\r\n");
      out.write("   }\r\n");
      out.write("   table.table-striped.table-hover tbody tr:hover {\r\n");
      out.write("      background: #f5f5f5;\r\n");
      out.write("   }\r\n");
      out.write("   table.table td a {\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("      color: #566787;\r\n");
      out.write("      display: inline-block;\r\n");
      out.write("      text-decoration: none;\r\n");
      out.write("      outline: none !important;\r\n");
      out.write("   }\r\n");
      out.write("</style>\r\n");
      out.write("<script>\r\n");
      out.write("   function changeForm(val) {\r\n");
      out.write("      if (val == \"0\") {\r\n");
      out.write("         location.href = '/tomato/member/memberUpdate.jsp';\r\n");
      out.write("         \r\n");
      out.write("      } else if(val ==\"1\") {\r\n");
      out.write("         location.href = '/tomato/member/memberDelete_ok.jsp';\r\n");
      out.write("         \r\n");
      out.write("      } else if(val == \"2\"){\r\n");
      out.write("         location.href='/tomato/member/mypage_buy.jsp';\r\n");
      out.write("         \r\n");
      out.write("      } else if(val == \"3\"){\r\n");
      out.write("         location.href='/tomato/member/mypage_qna.jsp';\r\n");
      out.write("         \r\n");
      out.write("      } else if(val ==\"4\"){\r\n");
      out.write("         location.href='/tomato/member/mypage_mylesson.jsp';\r\n");
      out.write("         \r\n");
      out.write("      } else if(val ==\"5\"){\r\n");
      out.write("         location.href='/tomato/member/mypage_community.jsp';\r\n");
      out.write("   }\r\n");
      out.write("      else if(val==\"6\"){\r\n");
      out.write("         location.href='/tomato/member/mypage_lesson.jsp';\r\n");
      out.write("      }else if(val==\"7\"){\r\n");
      out.write("    	  location.href='/tomato/member/mypage_sell.jsp';\r\n");
      out.write("      }\r\n");
      out.write(" }\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("#btn1{\r\n");
      out.write("   background-color: white;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("   border: 2px solid tomato;\r\n");
      out.write("}\r\n");
      out.write("#btn1:hovertn1{\r\n");
      out.write("   background-color: tomato;\r\n");
      out.write("   color: white;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("   border: 2px solid tomato;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header>\r\n");

String m_id=(String)session.getAttribute("m_id");
String m_name=(String)session.getAttribute("m_name");
if(m_id==null){
   
      out.write("\r\n");
      out.write("   <div>\r\n");
      out.write("   <a href=\"/tomato/member/login.jsp\">로그인</a> | <a href=\"/tomato/member/join.jsp\">회원가입</a>\r\n");
      out.write("   </div>\r\n");
      out.write("   ");
 
}else{
      
      out.write("\r\n");
      out.write("   <div>\r\n");
      out.write("   ");

   if(m_id.equals("admin")){
      
      out.write("\r\n");
      out.write("      <a href=\"/tomato/admin/memberList_admin.jsp\">");
      out.print(m_name );
      out.write("님 마이페이지</a> |\r\n");
      out.write("      ");

   }else{
      
      out.write("\r\n");
      out.write("      <a href=\"/tomato/member/mypage.jsp\">");
      out.print(m_name );
      out.write("님 마이페이지</a> |\r\n");
      out.write("      ");

   }
   
      out.write("\r\n");
      out.write("   <a href=\"/tomato/member/logout.jsp\">로그아웃</a>\r\n");
      out.write("   </div>\r\n");
      out.write("   ");

}

      out.write("\r\n");
      out.write("<nav>\r\n");
      out.write("<ul>\r\n");
      out.write("   <li><h1><a href=\"/tomato/index.jsp\"><img src=\"/tomato/img/토마토_메인로고.png\" alt=\"메인로고\" height=\"50px\" width=\"250px\"></a></h1></li>\r\n");
      out.write("   <li><h2><a href=\"/tomato/sell/sell.jsp\">SELL</a></h2></li>\r\n");
      out.write("   <li><h2><a href=\"/tomato/buy/buyList.jsp?col=s_idx&range=desc\">BUY</a></h2></li>\r\n");
      out.write("   <li><h2><a href=\"/tomato/lesson/lessonList.jsp\">LESSON</a></h2></li>\r\n");
      out.write("   <li><h2><a href=\"/tomato/community/community.jsp\">COMMUNITY</a></h2></li>\r\n");
      out.write("   <li><h2><a href=\"/tomato/qna/qnaList.jsp\">Q&A</a></h2></li>\r\n");
      out.write("   <li>\r\n");
      out.write("		<form name=\"headerSearch\" action=\"/tomato/buy/headerBuySearch.jsp\" style=\"display: inline;\">\r\n");
      out.write("			<input type=\"text\" name=\"searchValue\" placeholder=\"상품을 검색하세요\">\r\n");
      out.write("			<input type=\"submit\" value=\"검색\" id=\"btn1\">\r\n");
      out.write("		</form>\r\n");
      out.write("	</li>\r\n");
      out.write("</ul>\r\n");
      out.write("</nav>\r\n");
      out.write("<hr/>\r\n");
      out.write("</header>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<aside>\r\n");
      out.write("      <div class=\"dropdown-menu\">\r\n");
      out.write("<ul>\r\n");
      out.write("   <li class=\"menu1\"><b>내가 찜한 상품</b>\r\n");
      out.write("      <ul>\r\n");
      out.write("         <li><input type=\"button\" value=\"SELL\" id=\"joinbtn1\" onclick=\"changeForm(2)\"> </li>         \r\n");
      out.write("      </ul>\r\n");
      out.write("   </li>\r\n");
      out.write("   <hr>\r\n");
      out.write("   <li class=\"menu1\"><b>내가 올린 글</b>\r\n");
      out.write("      <ul>\r\n");
      out.write("         <li><input type=\"button\" value=\"Q & A\" id=\"joinbtn1\" onclick=\"changeForm(3)\"> </li>         \r\n");
      out.write("         <li><input type=\"button\" value=\"LESSON\" id=\"joinbtn1\" onclick=\"changeForm(4)\"></li>         \r\n");
      out.write("         <li><input type=\"button\" value=\"COMMUNITY\" id=\"joinbtn1\" onclick=\"changeForm(5)\"></li>\r\n");
      out.write("         <li><input type=\"button\" value=\"SELL\" id=\"joinbtn1\" onclick=\"changeForm(7)\"></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("   </li>\r\n");
      out.write("   <hr>\r\n");
      out.write("   <li class=\"menu1\"><b>내가 신청한 과정</b>\r\n");
      out.write("      <ul>\r\n");
      out.write("         <li><input type=\"button\" value=\"LESSON\" id=\"joinbtn1\" onclick=\"changeForm(6)\"> </li>         \r\n");
      out.write("      </ul>\r\n");
      out.write("   </li>\r\n");
      out.write("</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("</aside>\r\n");
 int m_idx=mdao.selectMidx(m_id); 
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int totalCnt=bdao.sellJjimTotalCnt(m_idx);

int listSize=20;
int pageSize=10;

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

      out.write("\r\n");
      out.write("            <div class=\"table-title\">\r\n");
      out.write("                     <h3>내가 찜한 <b>상품 목록</b></h3>\r\n");
      out.write("                  </div>\r\n");
      out.write("            <table class=\"table table-striped table-hover\">\r\n");
      out.write("               <thead>\r\n");
      out.write("                  <tr>\r\n");
      out.write("                     <th>상품 번호</th>\r\n");
      out.write("                     <th>상품 제목</th>\r\n");
      out.write("                     <th>상품 등록날짜</th>\r\n");
      out.write("                     <th>상품 상태</th>\r\n");
      out.write("                  </tr>\r\n");
      out.write("               </thead>\r\n");
      out.write("               <tbody>\r\n");
      out.write("               ");

            ArrayList<SellDTO> arr =  bdao.SellJjimList(m_idx);
            if(arr==null||arr.size()==0){
               
      out.write("\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td colspan=\"3\" align=\"center\">\r\n");
      out.write("                  찜한 목록이 없습니다.\r\n");
      out.write("                  </td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               ");

            }else {
               for(int i=0;i<arr.size();i++){
                  
      out.write("\r\n");
      out.write("                  <tr>\r\n");
      out.write("                    <td>");
      out.print(arr.get(i).getS_idx() );
      out.write("</td>             \r\n");
      out.write("                    <td><a href=\"/tomato/buy/buyContent.jsp?s_idx=");
      out.print(arr.get(i).getS_idx() );
      out.write('"');
      out.write('>');
      out.print(arr.get(i).getS_name() );
      out.write("</a></td>             \r\n");
      out.write("                    <td>");
      out.print(arr.get(i).getS_selldate() );
      out.write("</td>\r\n");
      out.write("                    <td>\r\n");
      out.write("                    	");

                    	String sellStatus;
                    	if(arr.get(i).getS_del()==1){
                    		sellStatus="삭제";
                    	}else if(arr.get(i).getS_sellok()==1){
                    		sellStatus="판매완료";
                    	}else{
                    		sellStatus="판매중";
                    	}
                    	
      out.write("\r\n");
      out.write("                    	");
      out.print(sellStatus );
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                 </tr>\r\n");
      out.write("                  ");

               }
            }
            
      out.write("\r\n");
      out.write("            </tbody>\r\n");
      out.write("            <tfoot>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td colspan=\"4\" align=\"center\">\r\n");
      out.write("					");

					if(userGroup!=0){
						
      out.write("\r\n");
      out.write("						<a href=\"mypage_buy.jsp?cp=1&m_idx=");
      out.print(m_idx);
      out.write("\">%lt;&lt;</a>\r\n");
      out.write("						<a href=\"mypage_buy.jsp?cp=");
      out.print((userGroup-1)*pageSize+pageSize );
      out.write("&m_idx=");
      out.print(m_idx);
      out.write("\">&lt;</a>\r\n");
      out.write("						");

					}
					
      out.write("\r\n");
      out.write("					");

					for(int i=userGroup*pageSize+1;i<userGroup*pageSize+pageSize;i++){
						String clickedPage=cp==i?"clicked":"unclicked";
						
      out.write("<label class=\"");
      out.print(clickedPage);
      out.write("\">\r\n");
      out.write("						&nbsp;&nbsp;<a href=\"mypage_buy.jsp?cp=");
      out.print(i );
      out.write("&m_idx=");
      out.print(m_idx);
      out.write('"');
      out.write('>');
      out.print(i );
      out.write("\r\n");
      out.write("						</a>&nbsp;&nbsp;</label>\r\n");
      out.write("						");

						if(i==totalPage){
							break;
						}
					}
					
      out.write("\r\n");
      out.write("					");

					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						
      out.write("\r\n");
      out.write("						<a href=\"mypage_buy.jsp?cp=");
      out.print((userGroup+1)*pageSize+1 );
      out.write("&m_idx=");
      out.print(m_idx);
      out.write("\">&gt;</a>\r\n");
      out.write("						<a href=\"mypage_buy.jsp?cp=");
      out.print(totalPage );
      out.write("&m_idx=");
      out.print(m_idx);
      out.write("\">&gt;&gt;</a>\r\n");
      out.write("						");

					}
					
      out.write("\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</tfoot>\r\n");
      out.write("               </table>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<footer>\r\n");
      out.write("<hr/>\r\n");
      out.write("<div>\r\n");
      out.write("고객문의&nbsp;&nbsp;ezen@gamil.com &nbsp;&nbsp;&nbsp;&nbsp;제휴문의&nbsp;&nbsp;ezen@naver.com\r\n");
      out.write("<br/>\r\n");
      out.write("지역광고&nbsp;&nbsp;ezen@gamil.com\r\n");
      out.write("<br/>\r\n");
      out.write("주소&nbsp;&nbsp;서울특별시 서대문구 신촌로 141 은하빌딩 1층 이젠아카데미 컴퓨터학원\r\n");
      out.write("</div>\r\n");
      out.write("<br/>\r\n");
      out.write("<div>Copyright &copy; Ezen & 3th. All Rights Reserved.</div>\r\n");
      out.write("</footer>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
