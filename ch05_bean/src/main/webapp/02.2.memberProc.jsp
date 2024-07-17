<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regBean" class="ch05.MemberBean" />
<jsp:setProperty name="regBean" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1" align="center">
			<tr>
				<th colspan="3">회원정보</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td colspan="2"><jsp:getProperty property="id" name="regBean"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td colspan="2"><jsp:getProperty property="pwd" name="regBean"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="2"><jsp:getProperty property="name" name="regBean"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="2"><jsp:getProperty property="birthday" name="regBean"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2"><jsp:getProperty property="email" name="regBean"/></td>
			</tr>
	</table>

</body>
</html>