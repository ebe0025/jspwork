<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>

<p> <%=name%>님의 혈액형은 A형이고 성격은 </p><br>
<pre>
보수적이고 소심하며 다른 혈액형보다 더 내성적인 경우가 많은 A형 사람들은 종종 예민하고 감정을 표현하거나 다른 사람을 신뢰하는 데 어려움을 겪습니다.
그들은 또한 일을 개인적으로 받아들이고 쉽게 상처를 받을 수 있습니다. 
그러나 그들은 또한 다른 사람들을 배려할 수 있고 참을성이 있으며 종종 시간을 잘 지킵니다.
</pre>

</body>
</html>