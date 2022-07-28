<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ServletTest3 클래스의 doGet() 메서드가 자동으로 호출되는 GET 방식 요청 -->
	<form action="Item" method="get">
		<input type="text" name="itemCode">
		<input type="submit" value="GET 방식 요청">
	</form>
	<hr>
	<!-- ServletTest3 클래스의 doPost() 메서드가 자동으로 호출되는 POST 방식 요청 -->
	<form action="Item" method="post">
		<input type="text" name="itemCode">
		<input type="submit" value="POST 방식 요청">
	</form>
	<hr>
	
	<h1>서블릿 LifeCycle 확인</h1>
	<form action="LifeCycle" method="get">
		<input type="text" name="name">
		<input type="submit" value="GET 방식 요청">
	</form>
	<hr>
	<form action="LifeCycle" method="post">
		<input type="text" name="name">
		<input type="submit" value="POST 방식 요청">
	</form>
</body>
</html>











