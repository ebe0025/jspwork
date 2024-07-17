<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="5kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer - remainBuffer;
%>
	총 버퍼 크기 <%=totalBuffer %>btye<p/>
	현재 사용한 버퍼 <%=useBuffer %>btye<p/>
	남아있는 버퍼 크기 <%=remainBuffer %>btye<p/>
</body>
</html>