<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="ch08.MemberMgr"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(mMgr.loginRegister(id, pwd))
	{
		session.setAttribute("idKey", id);
%>
<script type="text/javascript">
	alert("로그인 되었습니다");
	location.href = "login.jsp";
</script>
<% 
	}else{
%>
<script type="text/javascript">
	alert("로그인을 실패했습니다.");
	location.href = "login.jsp";
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