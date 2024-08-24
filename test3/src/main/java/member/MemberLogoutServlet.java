package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class MemberLogoutServlet
 */
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		request.getSession().setAttribute("idKey", null);
		
		out.println("<script>");
		out.println("	alert('로그아웃이 정상 작동되었습니다.')");
		out.println("	location.href = 'index.jsp';");
		out.println("</script>");
		
	
	}	

}
