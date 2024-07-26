package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class BoardDeleteServlet
 */
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		
		Board inBean = (Board)session.getAttribute("bean");
		int num = inBean.getNum();
		String nowPage = request.getParameter("nowPage");
		
		String inputPass = request.getParameter("pass");
		if(inBean.getPass().equals(inputPass))
		{
			if(new BoardDao().checkCanDeleteBoard(inBean))
			{
			
				new BoardDao().deleteBoard(num);
				response.sendRedirect("list.jsp?nowPage=" + nowPage);
			}
			else
			{
				out.println("<script>");
				out.println("   alert('댓글이 존재하는 글입니다.')");
				out.println("   history.go(-2);");
				out.println("</script>");
			}

		}
		else
		{
			out.println("<script>");
			out.println("   alert('비밀번호가 맞지 않습니다.')");
			out.println("   history.go(-2);");
			out.println("</script>");
		}
	}

}
