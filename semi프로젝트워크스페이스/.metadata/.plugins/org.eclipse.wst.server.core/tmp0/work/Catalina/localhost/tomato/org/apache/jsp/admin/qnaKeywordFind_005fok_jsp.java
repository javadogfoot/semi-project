/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-18 17:42:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import tomato.qna.*;

public final class qnaKeywordFind_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("tomato.qna");
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
      out.write("\r\n");
      out.write("\r\n");
      tomato.qna.QnaDAO qdao = null;
      qdao = (tomato.qna.QnaDAO) _jspx_page_context.getAttribute("qdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (qdao == null){
        qdao = new tomato.qna.QnaDAO();
        _jspx_page_context.setAttribute("qdao", qdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');

request.setCharacterEncoding("utf-8");
String keyword=request.getParameter("keyword");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("#joinbtn1{\r\n");
      out.write("   background-color: navy;\r\n");
      out.write("   color: white;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("}\r\n");
      out.write("#joinbtn1:hover{\r\n");
      out.write("   background: #f5f4f0;\r\n");
      out.write("   color: navy;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("}\r\n");
      out.write(".sidebar {\r\n");
      out.write("font-size : 3px;\r\n");
      out.write("font-weight : bold;\r\n");
      out.write("height: 500px;\r\n");
      out.write("width: 200px;\r\n");
      out.write("color: #999;\r\n");
      out.write("background: #f5f4f0;\r\n");
      out.write("}\r\n");
      out.write(".sidebar a {\r\n");
      out.write("padding: 15px 16px 15px 16px;\r\n");
      out.write("text-decoration: none;\r\n");
      out.write("font-size: 10pt;\r\n");
      out.write("color: navy;\r\n");
      out.write("display: block;\r\n");
      out.write("border: 1px bold tomato;\r\n");
      out.write("}\r\n");
      out.write(".sidebar a:hover {\r\n");
      out.write("color: tomato;\r\n");
      out.write("}\r\n");
      out.write("   table.table tr th, table.table tr td {\r\n");
      out.write("       border-color: #e9e9e9;\r\n");
      out.write("       width: 770px;\r\n");
      out.write("       text-align: center;\r\n");
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
      out.write("   h3{\r\n");
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
      out.write("   width:200px; \r\n");
      out.write("   float:left;\r\n");
      out.write("}\r\n");
      out.write("form {\r\n");
      out.write("   text-align : center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<section>\r\n");
      out.write("   <article>\r\n");
      out.write("           <h2>키워드 검색결과 </h2>\r\n");
      out.write("          <table class=\"table table-striped table-hover\" style=\"margin-left:200px; margin-top:25px;\">\r\n");
      out.write("         <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("               <th>글번호</th>\r\n");
      out.write("               <th>글제목</th>\r\n");
      out.write("               <th>작성자</th>\r\n");
      out.write("               <th>작성일</th>\r\n");
      out.write("               <th>답변현황</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("         ");

            ArrayList<QnaDTO> arr=qdao.keywordFind(keyword);
         	if(keyword!=null||keyword!=""){
	            if(arr==null||arr.size()==0){
	               
      out.write("\r\n");
      out.write("	               <tr>\r\n");
      out.write("	                  <td colspan=\"5\" align=\"center\">\r\n");
      out.write("	                  등록된 Q&A글이 없습니다.\r\n");
      out.write("	                  </td>\r\n");
      out.write("	               </tr>\r\n");
      out.write("	               ");

	            }else {
	               for(int i=0;i<arr.size();i++){
	                  
      out.write("\r\n");
      out.write("	                  <tr>\r\n");
      out.write("	                 <td>");
      out.print(arr.get(i).getQ_idx() );
      out.write("</td> \r\n");
      out.write("	                 <td><a href=\"/tomato/qna/qnaContent.jsp?q_idx=");
      out.print(arr.get(i).getQ_idx() );
      out.write('"');
      out.write('>');
      out.print(arr.get(i).getQ_sub() );
      out.write("</a></td>             \r\n");
      out.write("	                 <td>");
      out.print(arr.get(i).getM_id() );
      out.write("</td>             \r\n");
      out.write("	                 <td>");
      out.print(arr.get(i).getQ_joindate() );
      out.write("</td>             \r\n");
      out.write("	                 <td>");
      out.print(arr.get(i).getQ_status() );
      out.write("</td> \r\n");
      out.write("	                 <td><a href=\"/tomato/admin/qnaDel_admin.jsp?q_idx=");
      out.print(arr.get(i).getQ_idx() );
      out.write("\">삭제</a></td>            \r\n");
      out.write("	                 </tr>\r\n");
      out.write("	                  ");

	               }
	            }
         	}    
            
      out.write("\r\n");
      out.write("      </table>   \r\n");
      out.write("   </article>\r\n");
      out.write("</section>\r\n");
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
