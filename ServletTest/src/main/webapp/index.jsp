<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hi, Test Page 연결됨.</h1>
<h2>아이템 코드 : ${param.itemCode }</h2>
<form action="item" method="post">
<input type="text" name="itemCode" >
<input type="submit" value="완료">

</form>
<form action="item" method="get">
<input type="text" name="itemCode" >
<input type="submit" value="완료">
</form>
<hr>
<form action="LifeCycle" method="post">
<input type="text" name="name" >
<input type="submit" value="완료">

</form>
<form action="LifeCycle" method="get">
<input type="text" name="name" >
<input type="submit" value="완료">
</form>


</body>
</html>