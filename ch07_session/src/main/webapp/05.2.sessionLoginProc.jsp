<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch07.RegisterMgr"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(regMgr.loginRegister(id, pw)){
		session.setAttribute("idKey", id);
%>
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href="05.3.sessionLoginOk.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("로그인이 되지 않았습니다");
		location.href="05.1.sessionLogin.jsp";
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

</body>
</html>