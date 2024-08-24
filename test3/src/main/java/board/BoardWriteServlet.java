package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;




public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "uploads";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Board board = new Board();
		String name = (String)request.getSession().getAttribute("idKey");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		board.setName(name);
		board.setSubject(subject);
		board.setContent(content);
		
		if(new BoardDao().insertBoard(board)) {
			response.sendRedirect("list.jsp");
		}else {
			out.println("<script>");
			out.println("	alert('오류로 인하여 글작성을 실패했습니다.')");
			out.println("	history.go(-1)");
			out.println("</script>");
		}
		
		
	
		
	}

}
