/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-19 15:21:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.qna;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import tomato.qna.*;

public final class qnaContent_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      synchronized (session) {
        qdao = (tomato.qna.QnaDAO) _jspx_page_context.getAttribute("qdao", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (qdao == null){
          qdao = new tomato.qna.QnaDAO();
          _jspx_page_context.setAttribute("qdao", qdao, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
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
      out.write("\r\n");

request.setCharacterEncoding("utf-8");
String idx_s=request.getParameter("q_idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int q_idx=Integer.parseInt(idx_s);
QnaDTO dto=qdao.qnaContent(q_idx);
if(dto==null){
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');\r\n");
      out.write("	location.href='qnaList.jsp';\r\n");
      out.write("	</script>\r\n");
      out.write("	");

	return;
}

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tomato/css/mainLayout.css\">\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("	background: #f5f4f0;\r\n");
      out.write("	font-family: 'Roboto';\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form {\r\n");
      out.write("	width: 1200px;\r\n");
      out.write("	margin: 0 auto;\r\n");
      out.write("	padding: 30px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form h3 {\r\n");
      out.write("	color: dimgray;\r\n");
      out.write("	font-size: 40px;\r\n");
      out.write("	margin: 0 0 15px;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form table {\r\n");
      out.write("	width: 700px;\r\n");
      out.write("	margin: 0px auto;\r\n");
      out.write("	border-radius: 1px;\r\n");
      out.write("	background: #fff;\r\n");
      out.write("	border: 1px solid #f3f3f3;\r\n");
      out.write("	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\r\n");
      out.write("	padding: 30px;\r\n");
      out.write("}\r\n");
      out.write("a { \r\n");
      out.write("	text-decoration:none \r\n");
      out.write("}\r\n");
      out.write("table th{\r\n");
      out.write("    padding: 10px;\r\n");
      out.write("}\r\n");
      out.write("table td{\r\n");
      out.write("    padding-left: 10px;\r\n");
      out.write("}\r\n");
      out.write("table td a{\r\n");
      out.write("	color: gray;\r\n");
      out.write("}\r\n");
      out.write("table td a:hover{\r\n");
      out.write("	font-weight: bold;\r\n");
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

int m_idx=mdao.selectMidx(m_id);

      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("	<article>\r\n");
      out.write("		<div class=\"signup-form\">\r\n");
      out.write("		<table>\r\n");
      out.write("	         <tr>\r\n");
      out.write("	            <th>제목</th>\r\n");
      out.write("	            <td colspan=\"3\">");
      out.print(dto.getQ_sub() );
      out.write("</td>\r\n");
      out.write("	         </tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("	            <th>작성자</th>\r\n");
      out.write("	            <td>");
      out.print(dto.getM_id() );
      out.write("</td>\r\n");
      out.write("	        </tr>\r\n");
      out.write("	        <tr>\r\n");
      out.write("	            <th>작성날짜</th>\r\n");
      out.write("	            <td>");
      out.print(dto.getQ_joindate() );
      out.write("</td>\r\n");
      out.write("	         </tr>\r\n");
      out.write("	         <tr height=\"250\" width=\"500\">\r\n");
      out.write("	            <td colspan=\"2\" valign=\"top\" align=\"left\" style=\"word-break:break-all; padding: 40px 40px 40px 60px; border-top: 1px solid;\">\r\n");
      out.write("		           	");
if(dto.getQ_con()!=null){
	                
      out.write("\r\n");
      out.write("	                ");
      out.print(dto.getQ_con().replaceAll("\n", "<br>") );
      out.write("\r\n");
      out.write("	                ");

	           		}
	           		 
      out.write("\r\n");
      out.write("	            </td>\r\n");
      out.write("	         </tr>\r\n");
      out.write("	         </table>\r\n");
      out.write("	         <hr>\r\n");
      out.write("	         <table>\r\n");
      out.write("	         <tr>\r\n");
      out.write("	            <td colspan=\"4\" align=\"center\">\r\n");
      out.write("	            ");

	            if(m_idx != 0 && m_idx == dto.getM_idx() && m_idx != 1){
	            	 
      out.write("\r\n");
      out.write("	            	 <a href=\"qnaDel_ok.jsp?q_idx=");
      out.print(q_idx);
      out.write("\">삭제하기</a>\r\n");
      out.write("	            	 ");

	            }else if(m_idx != 0 && m_idx == 1){
	            	 
      out.write("\r\n");
      out.write("	            	 <a href=\"qnaDelAdmin_ok.jsp?q_idx=");
      out.print(q_idx);
      out.write("\">삭제하기</a>\r\n");
      out.write("	            	 <a href=\"qnaReWrite.jsp?q_idx=");
      out.print(q_idx );
      out.write("&q_sub=");
      out.print(dto.getQ_sub());
      out.write("&q_ref=");
      out.print(dto.getQ_ref());
      out.write("&q_lev=");
      out.print(dto.getQ_lev());
      out.write("&q_sunbun=");
      out.print(dto.getQ_sunbun());
      out.write("\">| 답변쓰기</a>\r\n");
      out.write("	            	 ");

	            }
	            
      out.write("\r\n");
      out.write("	            </td>   \r\n");
      out.write("	         </tr>\r\n");
      out.write("	         <tr>\r\n");
      out.write("	         	<td colspan=\"4\" align=\"center\"><a href=\"javascript:history.back();\">목록으로</a></td>\r\n");
      out.write("	         </tr>\r\n");
      out.write("	         </table>\r\n");
      out.write("	     </div>\r\n");
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
