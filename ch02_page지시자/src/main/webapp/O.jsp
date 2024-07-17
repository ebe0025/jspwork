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

<p> <%=name%>님의 혈액형은 O형이고 성격은 </p><br>
<pre>
O형은 타고난 리더이자 다재다능한 사람입니다. 그들은 외향적이고 낙관적이며 자신의 생각을 말하는 것을 두려워하지 않습니다. 
그들은 자신감 있게 대화를 나눌 수 있지만 말보다 행동으로 말하는 것이 훨씬 더 많습니다. 
혈액형 O형은 자신이 하는 일에서 성공하기 위해 노력하는 야심찬 개인입니다.
</pre>

</body>
</html>