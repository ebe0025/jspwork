<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
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

	<form action="boardUpdate" method="post">
	<table>
		<tr>
			<th align="center" colspan="2" 
			style="background-color: coral">수정하기</th>
		</tr>
		<tr>
			<td colspan="2"><br></td>
		</tr>
		<tr >
			<td width="15%" >성명</td>
			<td><input name="name" style="width: 80px;" value="<%=board.getName() %>"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input name="subject" style="width: 380px;" value="<%=board.getSubject() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="10" cols="50" ><%=board.getContent() %></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pass" type="password" style="width: 140px;" required>수정시에는 비밀번호가 필요합니다</td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top: 80px">
				<hr>
				<input type="submit" value="수정완료">
				<input type="reset" value="다시수정">
				<input type="button" value="뒤로" onclick="history.back()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>

</body>
</html>