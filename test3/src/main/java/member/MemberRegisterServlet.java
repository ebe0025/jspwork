package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class MemberRegisterServlet
 */
public class MemberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String job = request.getParameter("job");
		
		
		Member member = new Member(id, pwd, name, gender,
									birthday, email, zipcode,
									address, detailAddress, job);
		MemberMgr memberMgr = new MemberMgr();
		
		if(memberMgr.InsertMember(member))
		{
			
			out.println("<script>");
			out.println("	alert('회원가입이 정상적으로 작동되었습니다')");
			out.println("</script>");
			response.sendRedirect("../index.jsp");
			
		} else
		{
			out.println("<script>");
			out.println("	alert('회원가입 양식이 맞지 않습니다.')");
			out.println("	history.go(-1)");
			out.println("</script>");
		}
		
	}

}
