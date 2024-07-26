package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;


public class AjaxServletController5 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		
		Member bean = new MemberMgr().getMember(id);
		
		// 문자열로 바환 : Member의 toString() 호출
		//response.getWriter().print(bean);
		
		// 2. JSONObject
		/*
		JSONObject jobj = new JSONObject();
		jobj.put("id", bean.getId());
		jobj.put("name", bean.getName());
		jobj.put("gender", bean.getGender());
		jobj.put("email", bean.getEmail());
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
		*/
		
		//3. JSONObject를 알아서 GSON라이브러리 사용
		/*
		 * GSON 라이브러리
		   - 객체 하나만 응답시는 {key:value, key:value,....} 형태로 만들어져서 응답
		      > 객체의 필드느는 자동으로 key가 됨
		   - 자바 배열이나 ArrayList 응답시 JSONArray [value, value,...] 형태로 만들어져서 응답
		 
		 
		 */
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(bean, response.getWriter());
	}

}
