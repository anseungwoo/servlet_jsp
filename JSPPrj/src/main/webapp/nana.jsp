<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String cnt_ = "hi";
	int cnt = 100;

	for (int i = 0; i < cnt; i++) {
		out.println(i + 1 + ": 안녕 Hello ~~<br>");
	}
	%>
</body>
</html>