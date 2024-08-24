<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${idKey != null }">
			<b>${id }님 환영합니다.</b><br>
			즐거운 투표되세요<br>
			<a href="logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<form action="loginProc.do" method="post">
				 <table border="1" style="border-collapse: collapse;">
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
			
		</c:otherwise>
	</c:choose>

</body>
</html>