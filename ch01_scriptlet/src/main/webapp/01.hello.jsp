<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h4{
		background-color: yellow;
	}
</style>
<body>
	<h4>jsp 처음시작</h4>
	<%! String name = "홍길동"; %> <br>
	<%=name %>
	
	<!-- html 주석 -->
	<%-- jsp주석(html과 jsp가 혼재되어 있을 떄 사용) --%>
	<%! 
		//한줄 주석
		/*
			여러줄 주석
		*/
	%>
	
</body>
</html>