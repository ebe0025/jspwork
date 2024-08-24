package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class MemberCheckIdServlet
 */
public class MemberCheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getParameter("id");
		
		MemberMgr memberMgr = new MemberMgr();
		
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(memberMgr.checkId(id));
		
	}

}
