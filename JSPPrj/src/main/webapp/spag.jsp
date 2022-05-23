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
pageContext.setAttribute("result", "hello");

%>
<%=request.getAttribute("result") %>입니다.
${requestScope.result}<br>
${names[0]}<br>
${notice.title}<br>
${result}<br>
${param.n}<br>
${header.Host }<br>
</body>
</html>