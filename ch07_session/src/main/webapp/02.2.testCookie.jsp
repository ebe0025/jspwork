<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			out.print("Cookie Name : " + cookies[i].getName() + "<p/>");
			out.print("Cookie Value : " + cookies[i].getValue() + "<hr>");
		}
	}
%> --%>

<%
	Cookie[] cookies = request.getCookies();
%>
<%!
	public String getCookieValue(Cookie[] cookies, String name){
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				if(name.equals(cookies[i].getName())){
					return cookies[i].getValue();
				}
			}
		}
		return null;
	}
%>
이름 : <%=getCookieValue(cookies, "NAME") %><p/>
성별 : <%=getCookieValue(cookies, "GENDER") %><p/>
나이 : <%=getCookieValue(cookies, "AGE") %><p/>

</body>
</html>