<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>
  	<%=id %>님 반갑습니다<p/>
  	<a href="05.logout.jsp">로그아웃</a>
<%
	} else {%>
	<form action="PostServlet" method="post">
	ID : <input name="id"><p/>
	PW : <input type="password" name="pwd"><p/>
	EMAIL : <input name="email"><p/>
	<input type="submit" value="회원가입">
	</form>
<%
}
%>
</body>
</html>