/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-19 09:30:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.buy;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import tomato.sell.*;
import java.util.*;

public final class headerBuySearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("tomato.sell");
    _jspx_imports_classes = null;
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

      out.write('\r');
      out.write('\n');

request.setCharacterEncoding("UTF-8");
String searchValue=request.getParameter("searchValue");
if(searchValue==null){
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	window.alert('검색어를 입력해주세요.');\r\n");
      out.write("	location.href='/tomato/index.jsp';\r\n");
      out.write("	</script>\r\n");
      out.write("	");

	return;
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      tomato.sell.SellDAO sdao = null;
      sdao = (tomato.sell.SellDAO) _jspx_page_context.getAttribute("sdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (sdao == null){
        sdao = new tomato.sell.SellDAO();
        _jspx_page_context.setAttribute("sdao", sdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tomato/css/mainLayout.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<style>\r\n");
      out.write("table{\r\n");
      out.write("	width: 1000px;\r\n");
      out.write("	margin: 0px auto;\r\n");
      out.write("	padding: 30px;\r\n");
      out.write("}\r\n");
      out.write("table td{\r\n");
      out.write("	text-align: center;\r\n");
      out.write("	padding: 30px;\r\n");
      out.write("}\r\n");
      out.write(".sname{\r\n");
      out.write("	font-weight: bold;\r\n");
      out.write("	color: tomato;\r\n");
      out.write("}\r\n");
      out.write(".clicked{\r\n");
      out.write("	border: 0.5px solid white;\r\n");
      out.write("	background-color:teal;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
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
      out.write('\r');
      out.write('\n');

String col=request.getParameter("col");
String range=request.getParameter("range");
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
int totalCnt;
totalCnt=sdao.headerTotalCnt(searchValue);

int listSize=16;
int pageSize=10;

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("<article>\r\n");
      out.write("		<table>\r\n");
      out.write("		<tbody>\r\n");
      out.write("			");

			ArrayList<SellDTO> arr=sdao.headerSellList(searchValue, cp, listSize);
			
			if(arr==null|| arr.size()==0){
				
      out.write("\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td colspan=\"4\" align=\"center\">\r\n");
      out.write("					검색된 상품이 없습니다.\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("				");

			}else{
				for(int i=0;i<arr.size();i++){
					if(i%4==0&&i!=arr.size()-1){
						out.println("<tr>");
					}
					
      out.write("\r\n");
      out.write("					<td>\r\n");
      out.write("					<a href=\"buyContent.jsp?s_idx=");
      out.print(arr.get(i).getS_idx() );
      out.write("\">\r\n");
      out.write("					");

					boolean getComma=arr.get(i).getS_port().contains(",");
					String sellY_N="[거래중] ";
					if(getComma){
						int commaPosition=arr.get(i).getS_port().indexOf(",");
						
      out.write("\r\n");
      out.write("						<img src=\"");
      out.print(arr.get(i).getS_port().substring(0,commaPosition) );
      out.write("\" height=\"240\" width=\"240\" class=\"simg\">\r\n");
      out.write("						");

					}else{
						
      out.write("\r\n");
      out.write("						<img src=\"");
      out.print(arr.get(i).getS_port() );
      out.write("\" height=\"240\" width=\"240\" class=\"simg\">\r\n");
      out.write("						");

					}
					
      out.write("\r\n");
      out.write("					<br/><label class=\"sname\">");
      out.print(sellY_N );
      out.print(arr.get(i).getS_name() );
      out.write("</label>\r\n");
      out.write("					<br/><label>");
      out.print(arr.get(i).getS_price() );
      out.write("</label>\r\n");
      out.write("					</a></td>\r\n");
      out.write("					");

					if(i%4==3&&i!=arr.size()-1){
						out.println("</tr>");
					}
				}
			}
			
      out.write("\r\n");
      out.write("			</tr>\r\n");
      out.write("			</tbody>\r\n");
      out.write("			<tfoot>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td colspan=\"4\" align=\"center\">\r\n");
      out.write("					");

					if(userGroup!=0){
						
      out.write("\r\n");
      out.write("						<a href=\"headerBuySearch?cp=1&col=");
      out.print(col);
      out.write("&range=");
      out.print(range);
      out.write("&searchValue=");
      out.print(searchValue);
      out.write("\">%lt;&lt;</a>\r\n");
      out.write("						<a href=\"headerBuySearch?cp=");
      out.print((userGroup-1)*pageSize+pageSize );
      out.write("&col=");
      out.print(col);
      out.write("&range=");
      out.print(range);
      out.write("&searchValue=");
      out.print(searchValue);
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
      out.write("						&nbsp;&nbsp;<a href=\"headerBuySearch.jsp?cp=");
      out.print(i );
      out.write("&col=");
      out.print(col);
      out.write("&range=");
      out.print(range);
      out.write("&searchValue=");
      out.print(searchValue);
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
      out.write("						<a href=\"headerBuySearch.jsp?cp=");
      out.print((userGroup+1)*pageSize+1 );
      out.write("&col=");
      out.print(col);
      out.write("&range=");
      out.print(range);
      out.write("&searchValue=");
      out.print(searchValue);
      out.write("\">&gt;</a>\r\n");
      out.write("						<a href=\"headerBuySearch.jsp?cp=");
      out.print(totalPage );
      out.write("&col=");
      out.print(col);
      out.write("&range=");
      out.print(range);
      out.write("&searchValue=");
      out.print(searchValue);
      out.write("\">&gt;&gt;</a>\r\n");
      out.write("						");

					}
					
      out.write("\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</tfoot>\r\n");
      out.write("		</table>	\r\n");
      out.write("	</article>\r\n");
      out.write("</section>\r\n");
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
