<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어(Directive)</title>
</head>
<body>
	<!-- include 지시어를 사용하여 템플릿 페이지 제작 -->
	<!-- 페이지 상단에 표시될 test2_header.jsp 파일을 포함시키기 -->
	<%@ include file="test2_header.jsp" %>
	
	<hr>
	<h1>test2.jsp</h1>
	<a href="test2_2.jsp">test2_2 로 이동</a>
	<hr>
	
	<!-- 페이지 하단에 표시될 test2_footer.jsp 파일을 포함시키기 -->
	<%@ include file="test2_footer.jsp" %>
</body>
</html>



 





