<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키를 확인하는 페이지</h1>
	<%
	// 1. request 객체(요청정보)의 헤더에 "Cookie" 문자열 존재 여부 확인(생략 가능)
	String cookieHeader = request.getHeader("Cookie");
	
	// 2. 리턴받은 헤더 정보가 있을 경우(= null 이 아닐 경우)(생략 가능)
	if(cookieHeader != null) {
		// 3. request 객체로부터 쿠키 목록 가져오기(복수개일 수 있으므로 배열로 리턴됨)
		Cookie[] cookies = request.getCookies();
		
		// 4. 가져온 쿠키 목록이 null 이 아닐 경우에만 쿠키 꺼내기
		if(cookies != null) {
			// 5. 쿠키가 저장된 배열 크기만큼 반복하면서 쿠키 꺼내기
// 			for(int i = 0; i < cookies.length; i++) {
// 				// 6. 배열에서 쿠키를 꺼내서 사용(getName(), getValue() 등)
// 				out.println("쿠키명 : " + cookies[i].getName() + "<br>");
// 				out.println("쿠키값 : " + cookies[i].getValue() + "<br>");
// 			}
			
			// 향상된 for문 사용 시
			for(Cookie cookie : cookies) {
				// 6. 배열에서 쿠키를 꺼내서 사용(getName(), getValue() 등)
				out.println("쿠키명 : " + cookie.getName() + "<br>");
				out.println("쿠키값 : " + cookie.getValue() + "<br>");
				
				// 만약, 특정 쿠키만 사용할 경우
// 				if(cookie.getName().equals("cookieName")) {
// 					out.println("쿠키값 : " + cookie.getValue() + "<br>");
// 				}
				
			}
			
		}
	}
	%>
	<button onclick="location.href='test_delete.jsp'">쿠키 삭제</button>
</body>
</html>









