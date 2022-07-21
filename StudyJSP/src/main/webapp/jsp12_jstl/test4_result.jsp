<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL -test4_result.jsp</h1>

<h3>번호 : ${idx }</h3>
<h3>이름 : ${name }</h3>

<hr>
<c:forEach var="i" items="${memberList }">
<h3>아이디 : ${i.id}</h3>
<h3>이름 : ${i.name}</h3>
<h3>나이 : ${i.age}</h3>
<h3>비밀번호 : ${i.passwd}</h3>
<br>
</c:forEach>
<hr>
<c:forEach var="i" items="${names }" varStatus="status">
<h3>${status.index} 이름 : ${i}</h3>

</c:forEach>


</body>
</html>