<%@page import="ch06.Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.UseBeanDB4"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="uBean" class="ch06.UseBeanDB4"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 사용한 ORACLE연동</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서</th>
		</tr>
		<%
			ArrayList<Bean> alist = uBean.getList();
			for(int i = 0; i < alist.size(); i++){
				Bean bean = alist.get(i);
				%>
				<tr>
					<td><%=bean.getEmp_id() %></td>
					<td><%=bean.getEmp_name() %></td>
					<td><%=bean.getDept_name() %></td>
				</tr>
				<%
			}
		%>
	</table>
</body>
</html>