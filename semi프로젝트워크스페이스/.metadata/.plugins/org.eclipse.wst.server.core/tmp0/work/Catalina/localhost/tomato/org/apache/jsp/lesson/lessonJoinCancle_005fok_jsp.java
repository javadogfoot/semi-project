/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-19 09:00:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.lesson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import tomato.lesson.*;
import tomato.lesson_buy.*;
import tomato.member.*;
import java.util.*;

public final class lessonJoinCancle_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("tomato.lesson");
    _jspx_imports_packages.add("tomato.member");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("tomato.lesson_buy");
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
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP?????? ?????? GET, POST ?????? HEAD ??????????????? ???????????????. Jasper??? OPTIONS ????????? ?????? ???????????????.");
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
      tomato.lesson_buy.LessonBuyDTO lbdto = null;
      lbdto = (tomato.lesson_buy.LessonBuyDTO) _jspx_page_context.getAttribute("lbdto", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (lbdto == null){
        lbdto = new tomato.lesson_buy.LessonBuyDTO();
        _jspx_page_context.setAttribute("lbdto", lbdto, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("lbdto"), request);
      out.write('\r');
      out.write('\n');
      tomato.lesson_buy.LessonBuyDAO lbdao = null;
      synchronized (session) {
        lbdao = (tomato.lesson_buy.LessonBuyDAO) _jspx_page_context.getAttribute("lbdao", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (lbdao == null){
          lbdao = new tomato.lesson_buy.LessonBuyDAO();
          _jspx_page_context.setAttribute("lbdao", lbdao, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      tomato.lesson.LessonDAO ldao = null;
      synchronized (session) {
        ldao = (tomato.lesson.LessonDAO) _jspx_page_context.getAttribute("ldao", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (ldao == null){
          ldao = new tomato.lesson.LessonDAO();
          _jspx_page_context.setAttribute("ldao", ldao, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');

String m_id=(String)session.getAttribute("m_id");


if(m_id==null||m_id.equals("")){
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	window.alert('????????? ??? ?????? ???????????????');\r\n");
      out.write("	location.href='/tomato/member/login.jsp';\r\n");
      out.write("	</script>\r\n");
      out.write("	");

	return;
}
	int l_idx=Integer.parseInt(request.getParameter("l_idx"));
	int m_idx=Integer.parseInt(request.getParameter("m_idx"));
	
	boolean check=lbdao.m_idxCheck(l_idx, m_idx);
		if(check){
			ldao.getJoinCancleCnt(l_idx);
			
			int result=lbdao.lessonJoinCancle(l_idx, m_idx);
			String msg=result>0?"?????? ?????? ??????":"?????? ?????? ??????";
			
      out.write("\r\n");
      out.write("			<script>\r\n");
      out.write("				window.alert('");
      out.print(msg);
      out.write("');\r\n");
      out.write("				location.href='lessonList.jsp';\r\n");
      out.write("			</script>\r\n");
      out.write("			");

		}else{
			
      out.write("\r\n");
      out.write("			<script>\r\n");
      out.write("			window.alert('?????? ????????? ????????????.');\r\n");
      out.write("			location.href='lessonContent.jsp?l_idx=");
      out.print(l_idx);
      out.write("';\r\n");
      out.write("			</script>\r\n");
      out.write("			");

		}
			
      out.write('\r');
      out.write('\n');
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
