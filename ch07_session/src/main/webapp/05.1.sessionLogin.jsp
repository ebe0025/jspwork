<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>
	<script type="text/javascript">
		location.href = "05.3.sessionLoginOk.jsp";
	</script>
<%
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Cookie 로그인</h1>
	<form action="05.2.sessionLoginProc.jsp" method="post">
		ID : <input name="id"></p>
		PW : <input type="password" name="pw"></p>
		<input type="submit" value="login">
		<input type="reset">
	</form>
</body>
</html>