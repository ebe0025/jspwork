<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0 auto; }
	table{width:600px; margin-top: 50px;}
	body { background-color: beige;}
	.spaced { margin-top: 50px; }
</style>

</head>
<body>

	<form action="boardPost" method="post">
	<table>
		<tr>
			<th align="center" colspan="2" 
			style="background-color: rgb(183, 254, 112)">글쓰기</th>
		</tr>
		<tr>
			<td colspan="2"><br></td>
		</tr>
		<tr >
			<td width="15%" >성명</td>
			<td><input name="name" style="width: 80px;" required></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input name="subject" style="width: 380px;" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="10" cols="50" required></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pass" type="password" style="width: 140px;" required></td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top: 80px">
				<hr>
				<input type="submit" value="등록">
				<input type="reset" value="다시쓰기">
				<input type="button" value="리스트" onclick="location.href='list.jsp'">
			</td>
		</tr>
	
	</table>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>

</body>
</html>