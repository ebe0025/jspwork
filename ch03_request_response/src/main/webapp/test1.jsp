<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request1</title>
</head>
<body>
	<h1>Request Ex1</h1>
	<form action="test2.jsp">
		이름 : <input name="name"><br>
		학번 : <input name="studentNum"><br>
		성별 : 남자<input type="radio" name="gender" value="남">&emsp;
			  여자<input type="radio" name="gender" value="여"><p/>
		전공 : <select name="major">
		<option  value="국문학과">국문학과</option>
		<option  value="물리학과">물리학과</option>
		<option  value="철학과">철학과</option>
		<option  value="사학과">사학과</option>
		<option  value="국문학과">수학과</option>
		<option  value="국문학과">전기공학과</option>
		</select><p/>
		취미 : <input type="checkbox" name="hobby" value="여행">여행&emsp;
		<input type="checkbox" name="hobby" value="운동">운동&emsp;
		<input type="checkbox" name="hobby" value="게임">게임&emsp;
		<input type="checkbox" name="hobby" value="음악">음악&emsp;
		<input type="checkbox" name="hobby" value="요가">요가<p/>
		<input type="submit">
	</form>
</body>
</html>