package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class BoardDetailServlet
 */
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		new BoardDao().updateboardCount(num, 1);
		Board board = new BoardDao().getBoardDetail(num);
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("boardDetail.jsp").forward(request, response);
		
		
	
	}

}
