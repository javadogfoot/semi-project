/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-13 07:35:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class qnaList_005fadmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/footer.jsp", Long.valueOf(1633071175604L));
    _jspx_dependants.put("/header.jsp", Long.valueOf(1634102527361L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tomato/css/mainLayout.css\">\r\n");
      out.write("<style>\r\n");
      out.write("h3{\r\n");
      out.write("   text-align: center;\r\n");
      out.write("}\r\n");
      out.write("li {\r\n");
      out.write("   list-style-type: none;\r\n");
      out.write("}\r\n");
      out.write("h4 {\r\n");
      out.write("   text-align: center;\r\n");
      out.write("   margin: 0px auto;\r\n");
      out.write("}\r\n");
      out.write("aside { \r\n");
      out.write(" 	border-right: 1px solid;\r\n");
      out.write("	width:200px; \r\n");
      out.write("	float:left;\r\n");
      out.write("}\r\n");
      out.write("fieldset{\r\n");
      out.write("	margin: 0px auto;\r\n");
      out.write("	width: 700px;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header>\r\n");

String m_id=(String)session.getAttribute("m_id");
String m_name=(String)session.getAttribute("m_name");

if(m_id==null){
	
      out.write("\r\n");
      out.write("	<div>\r\n");
      out.write("	<a href=\"/tomato/member/login.jsp\">로그인</a> | <a href=\"/tomato/member/join.jsp\">회원가입</a>\r\n");
      out.write("	</div>\r\n");
      out.write("	");
 
}else{
	
      out.write("\r\n");
      out.write("	<div>\r\n");
      out.write("	");

	if(m_id.equals("admin1234")){
		
      out.write("\r\n");
      out.write("		<a href=\"/tomato/member/admin.jsp\">");
      out.print(m_name );
      out.write("님 마이페이지</a> |\r\n");
      out.write("		");

	}else{
		
      out.write("\r\n");
      out.write("		<a href=\"/tomato/member/mypage.jsp\">");
      out.print(m_name );
      out.write("님 마이페이지</a> |\r\n");
      out.write("		");

	}
	
      out.write("\r\n");
      out.write("	<a href=\"/tomato/member/logout.jsp\">로그아웃</a>\r\n");
      out.write("	</div>\r\n");
      out.write("	");

}

      out.write("\r\n");
      out.write("<nav>\r\n");
      out.write("<ul>\r\n");
      out.write("	<li><h1><a href=\"/tomato/index.jsp\">tomato</a></h1></li>\r\n");
      out.write("	<li><h2><a href=\"/tomato/sell/sell.jsp\">SELL</a></h2></li>\r\n");
      out.write("	<li><h2><a href=\"/tomato/buy/buyList.jsp\">BUY</a></h2></li>\r\n");
      out.write("	<li><h2><a href=\"/tomato/lesson/lessonList.jsp\">LESSON</a></h2></li>\r\n");
      out.write("	<li><h2><a href=\"/tomato/community/community.jsp\">COMMUNITY</a></h2></li>\r\n");
      out.write("	<li><h2><a href=\"/tomato/qna/qnaList.jsp\">Q&A</a></h2></li>\r\n");
      out.write("	<li><input type=\"text\" name=\"searchBar\">\r\n");
      out.write("		<input type=\"submit\" value=\"검색\"></li>\r\n");
      out.write("</ul>\r\n");
      out.write("</nav>\r\n");
      out.write("<hr/>\r\n");
      out.write("</header>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("      <h3>[Q & A 목록]</h3>\r\n");
      out.write("</section>\r\n");
      out.write("<aside>\r\n");
      out.write("	<section>   \r\n");
      out.write("         <ul id=\"listsix\">\r\n");
      out.write("         <li><label><a href=\"admin.jsp\">회원목록</a></label></li>\r\n");
      out.write("         <li><label><a href=\"buyList_admin.jsp\">상품목록</a></label></li>\r\n");
      out.write("         <li><label><a href=\"lessonList_admin.jsp\">클래스목록</a></label></li>\r\n");
      out.write("         <li><label><a href=\"repleList_admin.jsp\">댓글목록</a></label></li>\r\n");
      out.write("         <li><label><a href=\"communityList_admin.jsp\">커뮤니티목록</a></label></li>\r\n");
      out.write("         <li><label><a href=\"qnaList_admin.jsp\">큐엔에이목록</a></label></li>\r\n");
      out.write("         </ul>\r\n");
      out.write("	</section>\r\n");
      out.write("</aside>\r\n");
      out.write("<section>\r\n");
      out.write("	<form name=\"listAll\" method=\"post\">\r\n");
      out.write("	<fieldset>\r\n");
      out.write("		<input type=\"text\" name=\"keyword\" placeholder=\"키워드를 입력해주세요\" size=\"50\">\r\n");
      out.write("		<input type=\"button\" name=\"keywordSearchBt\" value=\"검색\" onclick=\"\">\r\n");
      out.write("		<input type=\"button\" name=\"listAll\" value=\"모두보기\">\r\n");
      out.write("	</fieldset>\r\n");
      out.write("	</form>\r\n");
      out.write("</section>\r\n");
      out.write("<section>\r\n");
      out.write("\r\n");
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
