<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//     String name=request.getParameter("name");
//     String sessionV=(String)session.getAttribute("test");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
			<tr>
				<td>\${param.name }</td>
				<td>${param.name }</td>
			</tr>
			<tr>
				<td>\${sessionScope.test }</td>
				<td>${sessionScope.test }</td>
			</tr>
				<tr>
				<td>\${param.num + 20}</td>
				<td>${param.num + 20}</td>
			</tr>
		</table>
</body>
</html>