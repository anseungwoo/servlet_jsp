<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- test1.jsp 페이지에서 AJAX 를 통해 요청한 작업에 대한 처리 및 응답 결과를 생성하는 페이지 -->
	<h1>AJAX - test1_result.jsp</h1>
	<!-- 실제 로그인 처리는 생략하고, 입력받은 아이디와 패스워드 출력 -->
	<!-- 이 때, AJAX 를 통해 전달받은 아이디와 패스워드는 파라미터 전달과 동일함 -->
	<h3>아이디 : ${param.id }</h3>
	<h3>패스워드 : ${param.passwd }</h3>
</body>
</html>