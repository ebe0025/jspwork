package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

public class AjaxServletReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		
		ArrayList<Reply> alist = new ReplyDao().getReplyList(bnum);
		
		Gson gson = new Gson();
		
		response.setContentType("application/json; charset=utf-8");
		gson.toJson(alist, response.getWriter());
		
		
		
	}

}
