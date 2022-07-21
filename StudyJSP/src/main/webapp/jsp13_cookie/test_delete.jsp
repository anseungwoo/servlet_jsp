<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키를 삭제하는 페이지</h1>
	<%
	// 쿠키 삭제를 위해서는 가져온 쿠키의 타이머(유효시간)를 0으로 설정
	// 1. 특정 쿠키만 삭제 시
	// => Cookie 객체를 새로 생성할 때 삭제할 쿠키명과 동일한 이름으로 설정, 타이머를 0으로 설정
// 	Cookie cookie = new Cookie("cookieName", null);
// 	cookie.setMaxAge(0); // 유효시간 0으로 설정(지금 삭제)
// 	response.addCookie(cookie);
	
	// 2. 전체 쿠키를 삭제 시
	// => 기존의 쿠키들을 가져와서 각 쿠키마다 타이머를 0으로 설정 후 전송
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		// 반복문을 통해 쿠키마다 타이머 0으로 설정
		for(Cookie cookie : cookies) {
			cookie.setMaxAge(0);
			// 타이머를 0으로 설정한 전체 쿠키를 전송하기 위해 각각의 쿠키를 담기
			response.addCookie(cookie);
		}
	}
	
	
	
	// 삭제된 쿠키 확인을 위해 test_use.jsp 페이지로 포워딩
	response.sendRedirect("test_use.jsp");
	%>
</body>
</html>











