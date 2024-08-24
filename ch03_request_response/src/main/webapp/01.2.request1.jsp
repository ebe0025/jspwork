<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String sNum = request.getParameter("studentNum");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");

	// EL에서 사용할 수 있도록 request 속성으로 설정
	request.setAttribute("gender", gender);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름은 <%= name %>, 학번은 <%=sNum %>, 성별은 ${gender}, 전공은 <%=major %><br>
	취미는 <% 
		for(int i = 0; i < hobby.length; i++) {
			if(i < hobby.length - 1){ %>
				<%=hobby[i] + ", "%>
			<%} else { %>
				<%=hobby[i]%>
			<% }
		}
	%>이다.

</body>
</html>