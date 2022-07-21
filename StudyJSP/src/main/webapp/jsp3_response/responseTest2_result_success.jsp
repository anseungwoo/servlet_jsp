<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터로 전달받은 id, passwd 값 가져와서 출력하기
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest2_result_success.jsp</h1>
	<h3>로그인 성공 시 응답 페이지</h3>
	<!-- request 객체를 통해 로그인 시 사용한 아이디, 패스워드 파라미터 출력 -->
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
</body>
</html>