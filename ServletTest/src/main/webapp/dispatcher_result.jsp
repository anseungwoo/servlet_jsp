<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Dispatcher 방식 포워딩 결과 확인</h1>
	<%-- request 객체에 저장된 파라미터 name 값 확인 --%>
<%-- 	<h3>이름 : <%=request.getParameter("name") %></h3> --%>
	<h3>이름 : ${param.name }</h3>
	<%--
	Dispatcher 방식으로 포워딩 했을 경우
	1. 포워딩에 사용된 요청 URL(dispatcher_result.jsp) 로 주소표시줄 주소가 변경되지 않고
	   이전 요청에 대한 URL 이 그대로 유지됨
	   (기존 요청 주소인 "DispatcherServlet" 주소가 그대로 남아있음)
	2. 이전 요청(DispatcherServlet)에서 사용된 request 객체가 그대로 유지(= 전달)되므로
	   포워딩 된 페이지(dispatcher_result.jsp)에서 이전 request 객체의 파라미터 등에 접근 가능함
	   따라서, request 객체의 파라미터 name 에 접근하여 값 출력 가능   
	--%>
</body>
</html>













