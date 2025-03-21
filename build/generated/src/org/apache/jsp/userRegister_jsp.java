package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userRegister_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("  <title>Login Form</title>\n");
      out.write("  <link rel=\"stylesheet\" href=\"login.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  <div class=\"wrapper\">\n");
      out.write("     <form action=\"userServlet?action=register\" method=\"post\">\n");
      out.write("      <h2>Register</h2>\n");
      out.write("        <div class=\"input-field\">\n");
      out.write("        <input type=\"text\" id=\"username\" name=\"username\" >\n");
      out.write("        <label>Enter your Username</label>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"input-field\">\n");
      out.write("        <input input type=\"password\" id=\"password\" name=\"password\">\n");
      out.write("        <label>Enter your password</label>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"input-field\">\n");
      out.write("        <input input type=\"email\" id=\"email\" name=\"email\">\n");
      out.write("        <label>Enter your e-mail</label>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"input-field\">\n");
      out.write("        <input input type=\"tel\" id=\"phoneNumber\" name=\"phoneNumber\">\n");
      out.write("        <label>Enter your phone number</label>\n");
      out.write("      </div>\n");
      out.write("      <button type=\"submit\" value=\"Register\">Register</button>\n");
      out.write("      <div class=\"register\">\n");
      out.write("        <p>Already have an account? <a href=\"userLogin.jsp\">Login</a></p>\n");
      out.write("      </div>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    // Function to get query parameters by name\n");
      out.write("    function getQueryParameter(name) {\n");
      out.write("      const urlParams = new URLSearchParams(window.location.search);\n");
      out.write("      return urlParams.get(name);\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    // Check if the 'message' query parameter is present\n");
      out.write("    const message = getQueryParameter('message');\n");
      out.write("    if (message) {\n");
      out.write("      // Display the message in a popup\n");
      out.write("      alert(message);\n");
      out.write("    }\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
