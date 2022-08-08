<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- test2.jsp 페이지에서 AJAX 를 통해 요청한 작업에 대한 처리 및 응답 결과를 생성하는 페이지 -->
	<h1>AJAX - test2_result.jsp</h1>
	<!-- id 가 "admin" 이고, passwd 가 "1234" 이면 "로그인 성공!", 아니면 "로그인 실패!" 출력 -->
	<c:choose>
		<c:when test="${param.id eq 'admin' && param.passwd eq '1234' }">
			<h3>로그인 성공!</h3>
		</c:when>
		<c:otherwise>
			<h3>로그인 실패!</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>












