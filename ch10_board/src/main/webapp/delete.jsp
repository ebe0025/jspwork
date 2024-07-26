<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0 auto; }
	table{width:300px; margin-top: 50px;}
	body { background-color: beige;}
	.spaced { margin-top: 50px; }
</style>
</head>
<body>
	<form action="boardDelete" method="post">
	<table>
		<tr>
			<td style="background-color: aquamarine;" align="center">사용자의 비밀번호를 입력해주세요<hr></td>
		</tr>
		<tr>
			<td><input name="pass" type="password" required style="margin-left: 60px; width: 180px"></td>
		</tr>
		<tr>
			<td style="padding-top: 10px"></td>
		</tr>
		<tr>
			<td>
				<hr>
				<input type="submit" value="삭제완료">
				<input type="reset" value="다시쓰기">
				<input type="button" value="뒤로">
			</td>
		</tr>
	</table>
	<input type="hidden" name="name" value="<%=num %>">
	<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>

</body>
</html>