/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.24
 * Generated at: 2019-11-03 02:37:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Member.Jeong;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class accessTerms_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1572075545569L));
    _jspx_dependants.put("jar:file:/C:/Users/KOSMO-08/Desktop/ProjectJSP/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/fmt.tld", Long.valueOf(1425946270000L));
    _jspx_dependants.put("jar:file:/C:/Users/KOSMO-08/Desktop/ProjectJSP/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

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
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
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
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write('\r');
      out.write('\n');

	request.setCharacterEncoding("utf-8");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>이용약관</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/init.css\"/>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/common.css\"/>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/jquery-2.1.1.min.js\"> </script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/jquery.easing.1.3.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/jquery-ui.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/prefixfree.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/Member/Jeong/css/style.css\"/>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <!--main_header_wrap-->\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/view/header.jsp", out, false);
      out.write("\r\n");
      out.write("    <!--//main_header_wrap-->\r\n");
      out.write("    <!--section-->\r\n");
      out.write("    <section>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/view/sideService.jsp", out, false);
      out.write("\r\n");
      out.write("        <div id=\"AT\" class=\"content\">\r\n");
      out.write("            <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/images/image_support/tit21.gif\"/>\r\n");
      out.write("            <article>\r\n");
      out.write("                    <textarea id=\"tx1\" cols=\"99\" rows=\"40\">\r\n");
      out.write("| 통번역시험위원회 회원 이용자약관 | \r\n");
      out.write("\r\n");
      out.write("제 1 장 총 칙 \r\n");
      out.write("\r\n");
      out.write("제1조 목 적\r\n");
      out.write("본 약관은 ㈜통번역시험위원회(이하 '회사')가 제공하는 itt.or.kr 서비스(이하 '서비스')의 이용조건 및 절차에 관해 규정함을 목적으로 합니다.\r\n");
      out.write("\r\n");
      out.write("제2조 약관의 효력과 변경\r\n");
      out.write("1. 약관은 이용자에게 공시함으로써 효력을 발생합니다.\r\n");
      out.write("2. 회사는 사정 변경의 경우와 영업상 중요 사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력을 발생합니다.\r\n");
      out.write("\r\n");
      out.write("제3조 약관 외 준칙 \r\n");
      out.write("이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제 2 장 회원 가입과 서비스 이용\r\n");
      out.write("\r\n");
      out.write("제1조 이용 계약의 성립\r\n");
      out.write("1. 이용계약은 이용자의 이용 신청에 대한 회사의 이용 응낙과 이용자의 약관 내용에 대한 동의로 성립됩니다.\r\n");
      out.write("2. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 회사에서 요청하는 개인 신상정보를 제공해야 합니다.\r\n");
      out.write("3. 회사가 이용 신청을 응낙하는 때에는 다음 사항을 이용자에게 통지합니다.\r\n");
      out.write("① 이용자 ID\r\n");
      out.write("② 서비스 이용 개시일\r\n");
      out.write("③ 기타 회사가 필요하다고 인정하는 사항\r\n");
      out.write("4. 회사는 다음 각 호에 해당하는 이용계약신청에 대하여는 이를 응낙하지 않습니다.\r\n");
      out.write("① 다른 사람의 명의를 사용하여 신청하였을 때\r\n");
      out.write("② 이용계약신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 신청하였을 때\r\n");
      out.write("③ 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때\r\n");
      out.write("\r\n");
      out.write("제2조 서비스 이용\r\n");
      out.write("1. 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.\r\n");
      out.write("2. 제1항의 이용시간은 정기점검 등의 필요로 인하여 회사가 정한 날 또는 시간은 그러하지 아니합니다.\r\n");
      out.write("3. 회원에 가입한 후라도 일부 서비스 이용 시 이용자의 연령에 따라 서비스 이용을 제한할 수 있습니다.\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제 3 장 책 임\r\n");
      out.write("\r\n");
      out.write("제1조 회사의 의무\r\n");
      out.write("1. 회사는 특별한 사정이 없는 한 이용자가 신청한 서비스 제공 개시일에 서비스를 이용 할 수 있도록 합니다.\r\n");
      out.write("2. 회사는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다.\r\n");
      out.write("3. 회사는 이용자의 개인 신상정보를 본인의 승낙 없이 타인에게 누설 또는 배포하여서는 아니 됩니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.\r\n");
      out.write("4. 회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 통보하여야 합니다.\r\n");
      out.write("\r\n");
      out.write("제2조 이용자의 의무\r\n");
      out.write("1. 회원은 당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.\r\n");
      out.write("2. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자가 이용하게 해서는 안 됩니다.\r\n");
      out.write("3. 회원은 당 사이트 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다. \r\n");
      out.write("1) 다른 회원의 비밀번호와 ID를 도용하여 부정 사용하는 행위\r\n");
      out.write("2) 저속, 음란, 모욕적, 위협적이거나 타인의 사생활를 침해할 수 있는 내용을 전송, 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위\r\n");
      out.write("3) 서비스를 통하여 전송된 내용의 출처를 위장하는 행위\r\n");
      out.write("4) 법률, 계약에 의해 이용할 수 없는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위\r\n");
      out.write("5) 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위\r\n");
      out.write("6) 당 사이트의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위\r\n");
      out.write("7) 다른 사용자의 개인정보를 수립 또는 저장하는 행위\r\n");
      out.write("8) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위\r\n");
      out.write("9) 선량한 풍속, 기타 사회질서를 해하는 행위\r\n");
      out.write("10) 타인의 명예를 훼손하거나 모욕하는 행위\r\n");
      out.write("11) 타인의 지적재산권 등의 권리를 침해하는 행위\r\n");
      out.write("12) 해킹행위 또는 컴퓨터바이러스의 유포행위\r\n");
      out.write("13) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위\r\n");
      out.write("14) 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위\r\n");
      out.write("15) 당 사이트에 게시된 정보의 변경\r\n");
      out.write("16) 기타 전기통신사업법 제53조 제1항과 전기통신사업법 시행령 16조(불온통신)에 위배되는 행위\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제 4 장 계약 해지 및 서비스 이용 제한\r\n");
      out.write("\r\n");
      out.write("제1조 계약 해지 및 이용 제한\r\n");
      out.write("이용자가 이용계약을 해지 하고자 하는 때에는 이용자 본인이 직접 온라인을 통해 개인정보변경/탈퇴 메뉴를 선택하셔서 해지신청을 하여야 합니다. 회사는 이용자가 다음 사항에 해당하는 행위를 하였을 경우 사전 통지 없이 이용계약을 해지 하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.\r\n");
      out.write("\r\n");
      out.write("(1) 공공 질서 및 미풍양속에 반하는 경우\r\n");
      out.write("(2) 범죄적 행위에 관련되는 경우\r\n");
      out.write("(3) 이용자가 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행 할 경우\r\n");
      out.write("(4) 타인의 서비스 아이디 및 비밀번호를 도용한 경우\r\n");
      out.write("(5) 타인의 명예를 손상시키거나 불이익을 주는 경우\r\n");
      out.write("(6) 같은 사용자가 다른 아이디로 이중 등록을 한 경우\r\n");
      out.write("(7) 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우\r\n");
      out.write("(8) 기타 관련법령이나 회사가 정한 이용조건에 위배되는 경우\r\n");
      out.write("\r\n");
      out.write("제2조 이용 제한의 해제 절차\r\n");
      out.write("1. 회사는 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다. 다만, 회사가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다. \r\n");
      out.write("2. 제1항의 규정에 의하여 이용 정지의 통지를 받은 이용자 또는 그 대리인은 그 이용 정지의 통지에 대하여 이의가 있을 때에는 이의신청을 할 수 있습니다. \r\n");
      out.write("3. 회사는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용 정지를 일시 연기할 수 있으며, 그 결과를 이용자 또는 그 대리인에게 통지합니다. \r\n");
      out.write("4. 회사는 이용 정지 기간 중에 그 이용 정지 사유가 해소된 것이 확인된 경우에는 이용 정지 조치를 즉시 해제합니다.\r\n");
      out.write("\r\n");
      out.write("제3조 이용자의 게시물\r\n");
      out.write("회사는 이용자가 게시하거나 등록하는 서비스 내의 내용물이 다음 각 사항에 해당된다고 판단되는 경우에 사전 통지 없이 삭제할 수 있습니다.\r\n");
      out.write("\r\n");
      out.write("1. 다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우\r\n");
      out.write("2. 공공질서 및 미풍양속에 위반되는 내용인 경우\r\n");
      out.write("3. 범죄적 행위에 결부된다고 인정되는 내용일 경우\r\n");
      out.write("4. 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우\r\n");
      out.write("5. 기타 관계법령이나 회사에서 정한 규정에 위배되는 경우\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제 5 장 계약변경 등\r\n");
      out.write("\r\n");
      out.write("제1조 계약사항의 변경\r\n");
      out.write("1. 이용자는 내용을 변경하거나, 서비스를 해지할 경우에는 전화나 서비스/브라우저를 통해서 이용계약을 변경/해지하여야 합니다.\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제 6 장 정보의 제공\r\n");
      out.write("\r\n");
      out.write("제1조 정보의 제공\r\n");
      out.write("1. 회사는 이용자가 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 전자우편이나 서신우편 등의 방법으로 이용자에게 제공할 수 있습니다.\r\n");
      out.write("2. 회원 가입은 본인 가입을 원칙으로 하며, 만약 허위 가입시 적립금 회수는 물론 제명 처리되며, 이로 인해 발생하는 일체의 피해에 대해서는 허위 가입자에게 법적인 책임이 있음을 알려드립니다. \r\n");
      out.write("\r\n");
      out.write("제2조 사용자의 정보 보안\r\n");
      out.write("1. 가입 신청자가 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.\r\n");
      out.write("2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 회사에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.\r\n");
      out.write("3. 이용자는 서비스의 사용 종료 시마다 정확히 접속을 종료해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 회사는 책임을 부담하지 아니합니다.\r\n");
      out.write("\r\n");
      out.write("제3조 서비스의 중지\r\n");
      out.write("1. 회사는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.\r\n");
      out.write("2. 회사가 통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며 타인(통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템중단 등의 경우에는 통지하지 않습니다.\r\n");
      out.write("3. 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 당 사이트가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.\r\n");
      out.write("4. 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 불가능할 경우, 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 이용자에게 사전 또는 사후에 공지합니다.\r\n");
      out.write("\r\n");
      out.write("제4조 서비스의 변경 및 해지\r\n");
      out.write("1. 회사는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.\r\n");
      out.write("\r\n");
      out.write("2. 회사는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.\r\n");
      out.write("\r\n");
      out.write("제5조 게시물의 저작권\r\n");
      out.write("1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.\r\n");
      out.write("2. 회사는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영원칙에 따라 사전 통지 없이 삭제할 수 있습니다.\r\n");
      out.write("3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제7장 기타\r\n");
      out.write("\r\n");
      out.write("제1조 양도금지\r\n");
      out.write("1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.\r\n");
      out.write("\r\n");
      out.write("제2조 손해배상\r\n");
      out.write("1. 회사는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 회사가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다. \r\n");
      out.write("\r\n");
      out.write("제3조 면책조항\r\n");
      out.write("1. 당 사이트는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.\r\n");
      out.write("2. 당 사이트는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.\r\n");
      out.write("3. 당 사이트는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.\r\n");
      out.write("4. 회사는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 회사는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. \r\n");
      out.write("\r\n");
      out.write("5. 회사는 회원 간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. \r\n");
      out.write("6. 회사는 서비스 이용과 관련하여 귀하에게 발생한 손해 중 귀하의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다. \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("제4조 재판관할\r\n");
      out.write("1. 회사와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.\r\n");
      out.write("\r\n");
      out.write("부 칙 1. (시행일) 본 약관은 2009년 1월 1일부터 시행됩니다.\r\n");
      out.write("\r\n");
      out.write("                    </textarea>\r\n");
      out.write("            </article>\r\n");
      out.write("        </div>\r\n");
      out.write("    </section>\r\n");
      out.write("    <!--//section-->\r\n");
      out.write("    <!--main_footer-->\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/view/footer.jsp", out, false);
      out.write("\r\n");
      out.write("    <!--//main_footer-->\r\n");
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

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    boolean _jspx_th_c_005fset_005f0_reused = false;
    try {
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /Member/Jeong/accessTerms.jsp(4,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("contextPath");
      // /Member/Jeong/accessTerms.jsp(4,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/Member/Jeong/accessTerms.jsp(4,0) '${pageContext.request.contextPath}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      _jspx_th_c_005fset_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fset_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fset_005f0_reused);
    }
    return false;
  }
}
