<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>포워딩 방식 비교</h1>
	<form action="RedirectTest" method="get">
		이름 : <input type="text" name="name">
		<input type="submit" value="포워딩(Redirect)">
	</form>
	<hr>
	<form action="DispatcherTest" method="get">
		이름 : <input type="text" name="name">
		<input type="submit" value="포워딩(Dispatcher)">
	</form>
</body>
</html>












