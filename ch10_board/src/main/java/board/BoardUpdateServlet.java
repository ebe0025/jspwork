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
 * Servlet implementation class BoardUpdateServlet
 */
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
		
		String nowPage = request.getParameter("nowPage");
		
		Board upBean = new Board();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		
		//데이터베이스를 접근하지 않고 bean 세션에서 가져오는 것이 가능함
		HttpSession session = request.getSession();
		Board inBean = (Board)session.getAttribute("bean");
		
		if(inBean.getPass().equals(upBean.getPass())) {
			new BoardDao().updateBoard(upBean);
			response.sendRedirect("read.jsp?nowPage="+ nowPage + "&num=" + upBean.getNum());
		}
		else
		{
			out.println("<script>");
			out.println("   alert('비밀번호가 맞지 않습니다.')");
			out.println("   history.back();");
			out.println("</script>");
		}
	}

}
