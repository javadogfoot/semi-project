/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.70
 * Generated at: 2021-10-19 08:59:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.sell;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import tomato.sell.*;

public final class sell_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");

request.setCharacterEncoding("UTF-8");

      out.write('\r');
      out.write('\n');
      tomato.sell.SellDAO sdao = null;
      sdao = (tomato.sell.SellDAO) _jspx_page_context.getAttribute("sdao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (sdao == null){
        sdao = new tomato.sell.SellDAO();
        _jspx_page_context.setAttribute("sdao", sdao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      tomato.member.MemberDAO mdao = null;
      synchronized (session) {
        mdao = (tomato.member.MemberDAO) _jspx_page_context.getAttribute("mdao", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (mdao == null){
          mdao = new tomato.member.MemberDAO();
          _jspx_page_context.setAttribute("mdao", mdao, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');

String s_idx_s=request.getParameter("s_idx");
if(s_idx_s==null||s_idx_s.equals("")){
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	window.alert('수정할수 없는 게시물입니다.');\r\n");
      out.write("	location.href='/tomato/index.jsp';\r\n");
      out.write("	</script>\r\n");
      out.write("	");

	return;
}
int s_idx=Integer.parseInt(s_idx_s);
SellDTO dto=sdao.updateSellList(s_idx);
if(dto==null){
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	window.alert('수정할 수 없는 게시물입니다.');\r\n");
      out.write("	location.href='/tomato/index.jsp';\r\n");
      out.write("	</script>\r\n");
      out.write("	");

}

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/tomato/css/mainLayout.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<script>\r\n");
      out.write("document.sellupdate.s_cate.value=");
      out.print(dto.getS_cate());
      out.write(";\r\n");
      out.write("document.sellupdate.s_addr.value=");
      out.print(dto.getS_addr());
      out.write(";\r\n");
      out.write("function checkForm(){\r\n");
      out.write("	var form=document.sellupdate;\r\n");
      out.write("	var regExpPrice=/^[0-9]{1,10}$/;\r\n");
      out.write("	/**제품 이름 유효성검사*/\r\n");
      out.write("	if(form.s_name.value==null||form.s_name.value==\"\"){\r\n");
      out.write("		alert('제품 이름을 입력해주세요.');\r\n");
      out.write("		form.s_name.focus();\r\n");
      out.write("		return false;\r\n");
      out.write("	}else if(form.s_name.value.length<5||form.s_name.value.length>15){\r\n");
      out.write("		alert('제품 이름은 5-12글자 이내로 입력가능합니다.');\r\n");
      out.write("		form.s_name.focus();\r\n");
      out.write("		return false;\r\n");
      out.write("	}\r\n");
      out.write("	/**가격 유효성 검사*/\r\n");
      out.write("	if(form.s_price.value==\"\"||form.s_price.value==null){\r\n");
      out.write("		alert('제품 가격을 입력해주세요.');\r\n");
      out.write("		form.s_price.focus();\r\n");
      out.write("		return false;\r\n");
      out.write("	}else if(!regExpPrice.test(form.s_price.value)){\r\n");
      out.write("		alert('제품 가격은 숫자만 입력가능하며 1,000,000,000까지 설정가능합니다.');\r\n");
      out.write("		form.s_price.select();\r\n");
      out.write("		return false;\r\n");
      out.write("	}\r\n");
      out.write("	/**카테고리 유효성 검사*/\r\n");
      out.write("	if(form.s_cate.value==\"\"||form.s_cate.value==null){\r\n");
      out.write("		alert('품목을 선택해주세요.');\r\n");
      out.write("		form.s_cate.select();\r\n");
      out.write("		return false;\r\n");
      out.write("	}\r\n");
      out.write("	/**제품 설명 유효성 검사*/\r\n");
      out.write("	if(form.s_con.value==\"\"||form.s_con.value==null){\r\n");
      out.write("		alert('제품 설명을 입력해주세요.');\r\n");
      out.write("		form.s_con.focus();\r\n");
      out.write("		return false;\r\n");
      out.write("	}else if(form.s_con.value.length<10||form.s_con.value.length>500){\r\n");
      out.write("		alert('제품 설명은 10-500글자 이내로 입력가능합니다.');\r\n");
      out.write("		form.s_con.select();\r\n");
      out.write("		return false;\r\n");
      out.write("	}\r\n");
      out.write("	form.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("   background: #f5f4f0;\r\n");
      out.write("   font-family: 'Roboto';\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("h3{\r\n");
      out.write("   text-align: center;\r\n");
      out.write("   font-size: 40px;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("}\r\n");
      out.write("table{\r\n");
      out.write("   width: 500px;\r\n");
      out.write("   margin: 0px auto;\r\n");
      out.write("   margin-bottom: 10px;\r\n");
      out.write("}\r\n");
      out.write("table td{\r\n");
      out.write("   padding: 8px;\r\n");
      out.write("}\r\n");
      out.write("input, select{\r\n");
      out.write("   height: 23px;\r\n");
      out.write("}\r\n");
      out.write("table th{\r\n");
      out.write("   padding-right: 25px;\r\n");
      out.write("   padding-bottom: 10px;\r\n");
      out.write("   font-size: 18px;\r\n");
      out.write("   text-align: right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form {\r\n");
      out.write("   width: 550px;\r\n");
      out.write("   margin: 0 auto;\r\n");
      out.write("   padding: 30px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form h3 {\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-size: 40px;\r\n");
      out.write("   margin: 0 0 15px;\r\n");
      out.write("   text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form form {\r\n");
      out.write("   border-radius: 1px;\r\n");
      out.write("   margin-bottom: 15px;\r\n");
      out.write("   background: #fff;\r\n");
      out.write("   border: 1px solid #f3f3f3;\r\n");
      out.write("   box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);\r\n");
      out.write("   padding: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".signup-form label {\r\n");
      out.write("   font-size: 13px;\r\n");
      out.write("   background-color: white;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height: 23px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("#sellBtn1{\r\n");
      out.write("   background-color: lightgray;\r\n");
      out.write("   color: black;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height: 23px;\r\n");
      out.write("   margin: 2px;\r\n");
      out.write("   border: 2px solid lightgray;\r\n");
      out.write("}\r\n");
      out.write("#sellBtn2{\r\n");
      out.write("   background-color: white;\r\n");
      out.write("   color: tomato;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("   border: 2px solid tomato;\r\n");
      out.write("}\r\n");
      out.write("#sellBtn2:hover{\r\n");
      out.write("   background-color: tomato;\r\n");
      out.write("   color: white;\r\n");
      out.write("   font-weight: bold;\r\n");
      out.write("   height:23px;\r\n");
      out.write("   border: none;\r\n");
      out.write("   margin:2px;\r\n");
      out.write("   border: 2px solid tomato;\r\n");
      out.write("}\r\n");
      out.write(".title{\r\n");
      out.write("   text-align: center;\r\n");
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
      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("	<article>\r\n");
      out.write("	<div class=\"signup-form\">\r\n");
      out.write("	<h3>제품 정보 수정</h3>\r\n");
      out.write("		<form name=\"sellupdate\" action=\"sell_update_ok.jsp\">\r\n");
      out.write("		<input type=\"hidden\" name=\"s_idx\" value=\"");
      out.print(dto.getS_idx() );
      out.write("\">\r\n");
      out.write(" 			<table>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th><label>제품명</label></th>\r\n");
      out.write("					<td><input type=\"text\" name=\"s_name\" value=\"");
      out.print(dto.getS_name() );
      out.write("\"></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th><label>가격</label></th>\r\n");
      out.write("					<td><input type=\"text\" name=\"s_price\" value=\"");
      out.print(dto.getS_price());
      out.write("\"></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th><label>품목</label></th>\r\n");
      out.write("					<td>\r\n");
      out.write("						<select name=\"s_cate\">\r\n");
      out.write("						<option value=\"디지털기기\">디지털기기</option>\r\n");
      out.write("						<option value=\"생활가전\">생활가전</option>\r\n");
      out.write("						<option value=\"가구/인테리어\">가구/인테리어</option>\r\n");
      out.write("						<option value=\"유아동\">유아동</option>\r\n");
      out.write("						<option value=\"생활/가공식품\">생활/가공식품</option>\r\n");
      out.write("						<option value=\"유아도서\">유아도서</option>\r\n");
      out.write("						<option value=\"스포츠/레져\">스포츠/레저</option>\r\n");
      out.write("						<option value=\"여성잡화\">여성잡화</option>\r\n");
      out.write("						<option value=\"여성의류\">여성의류</option>\r\n");
      out.write("						<option value=\"남성패션/잡화\">남성패션/잡화</option>\r\n");
      out.write("						<option value=\"게임/취미\">게임/취미</option>\r\n");
      out.write("						<option value=\"뷰티/미용\">뷰티/미용</option>\r\n");
      out.write("						<option value=\"반려동물용품\">반려동물용품</option>\r\n");
      out.write("						<option value=\"도서/티켓/음반\">도서/티켓/음반</option>\r\n");
      out.write("						<option value=\"식물\">식물</option>\r\n");
      out.write("						<option value=\"기타중고물품\">기타중고물품</option>\r\n");
      out.write("					</select>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				");

				String m_addr=mdao.findAddr(m_id);
				if(dto.getS_addr().equals(m_addr)){
					
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th><label>주소</label></th>\r\n");
      out.write("						<td><input type=\"text\" name=\"s_addr\" value=\"");
      out.print(dto.getS_addr());
      out.write("\" readonly></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					");

				}else{
					
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("					<th><label>주소</label></th>\r\n");
      out.write("						<td>\r\n");
      out.write("						<select name=\"s_addr\">\r\n");
      out.write("							<option value=\"강남구\">강남구</option>\r\n");
      out.write("							<option value=\"강동구\">강동구</option>\r\n");
      out.write("							<option value=\"강북구\">강북구</option>\r\n");
      out.write("							<option value=\"강서구\">강서구</option>\r\n");
      out.write("							<option value=\"관악구\">관악구</option>\r\n");
      out.write("							<option value=\"광진구\">광진구</option>\r\n");
      out.write("							<option value=\"구로구\">구로구</option>\r\n");
      out.write("							<option value=\"금천구\">금천구</option>\r\n");
      out.write("							<option value=\"노원구\">노원구</option>\r\n");
      out.write("							<option value=\"도봉구\">도봉구</option>\r\n");
      out.write("							<option value=\"동대문구\">동대문구</option>\r\n");
      out.write("							<option value=\"동작구\">동작구</option>\r\n");
      out.write("							<option value=\"마포구\">마포구</option>\r\n");
      out.write("							<option value=\"서대문구\">서대문구</option>\r\n");
      out.write("							<option value=\"서초구\">서초구</option>\r\n");
      out.write("							<option value=\"성동구\">성동구</option>\r\n");
      out.write("							<option value=\"성북구\">성북구</option>\r\n");
      out.write("							<option value=\"송파구\">송파구</option>\r\n");
      out.write("							<option value=\"양천구\">양천구</option>\r\n");
      out.write("							<option value=\"영등포구\">영등포구</option>\r\n");
      out.write("							<option value=\"용산구\">용산구</option>\r\n");
      out.write("							<option value=\"은평구\">은평구</option>\r\n");
      out.write("							<option value=\"종로구\">종로구</option>\r\n");
      out.write("							<option value=\"중랑구\">중랑구</option>\r\n");
      out.write("						</select>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					");
	
				}
				
      out.write("\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th><label>제품 설명</label></th>\r\n");
      out.write("					<td><textarea name=\"s_con\" cols=\"40\" rows=\"10\">");
      out.print(dto.getS_con());
      out.write("</textarea></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th><label>판매현황</label></th>\r\n");
      out.write("					<td>\r\n");
      out.write("						<select name=\"s_sellok\">\r\n");
      out.write("							<option value=\"0\">거래중</option>\r\n");
      out.write("							<option value=\"1\">거래완료</option>\r\n");
      out.write("						</select>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</table>\r\n");
      out.write("			<div style=\"text-align:center;\">\r\n");
      out.write("				<input type=\"button\" value=\"수정하기\" id=\"sellBtn2\" onclick=\"checkForm();\">\r\n");
      out.write("			</div>\r\n");
      out.write("		</form>\r\n");
      out.write("	</div>	\r\n");
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
