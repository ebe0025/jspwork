<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#buttons{
		text-align: center;
	}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>    
		<b><%=id %></b>님 환영합니다.<p/>
		즐거운 쇼핑되세요<p/>
		<a href="logout.jsp">로그아웃</a>
<%
	} else {
%>


	<form action="loginProc.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" id="buttons">
					<input type="submit" value="로그인"> &emsp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">
					<input type="button" value="홈으로" onclick="location.href='../index.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
<%
	}
%>
</body>
</html>