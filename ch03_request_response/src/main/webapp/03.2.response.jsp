<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sendRedirect Ex</h1>
	<%
	// 자주 웹페이즈가 업데이트를 될 때 사용
		if(request.getProtocol().equals("HTTP/1.1"))
		{
			response.setHeader("Cache-Control", "no-store"); // HTTP/1.1
		}
		else
			response.setHeader("Pragma", "no-cache"); //HTTP/1.0
	%>
	
	03.2.response.jsp파일의 본문입니다.
</body>
</html>