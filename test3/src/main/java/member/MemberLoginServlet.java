package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class MemberCheckServlet
 */
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)request.getParameter("id");
		String pwd = (String)request.getParameter("pwd");
		
		MemberMgr memberMgr = new MemberMgr();
		if(memberMgr.loginCheck(id, pwd))
		{
			request.getSession().setAttribute("idKey", id);
			out.println("<script>");
			out.println("	alert('로그인되었습니다')");
			out.println("	location.href = 'index.jsp'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("	alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
			out.println("	history.go(-1)");
			out.println("</script>");
		}
	}

}
