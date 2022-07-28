<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Redirect 방식 포워딩 결과 확인</h1>
	<%-- request 객체에 저장된 파라미터 name 값 확인 --%>
<%-- 	<h3>이름 : <%=request.getParameter("name") %></h3> --%>
	<h3>이름 : ${param.name }</h3>
	<%--
	Redirect 방식으로 포워딩 했을 경우
	1. 포워딩에 사용된 요청 URL(redirect_result.jsp) 로 주소표시줄 주소가 변경됨
	   (기존 요청 주소 : RedirectServlet -> 새 요청 주소 : redirect_result.jsp)
	2. 새로운 요청에 의해 새 request 객체가 생성되므로
	   이전 요청(RedirectServlet)에서 저장되어 있던 request 객체의 파라미터 등은
	   더 이상 존재하지 않게 됨(= 접근 불가능하게 됨)
	   따라서, request 객체의 파라미터 접근 시 파라미터가 없으므로 값 출력 불가능(널스트링"" 출력)   
	--%>
</body>
</html>









