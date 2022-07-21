<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 쿠키 생성 - Cookie 객체 생성
// => 생성자 파라미터로 쿠키명(String)과 쿠키값(String)을 설정
Cookie cookie = new Cookie("cookieName", "cookieValue");

// 2. 생성된 쿠키의 유효시간 설정
// => Cookie 객체의 setMaxAge() 메서드를 호출하여 유효시간 설정(초 단위)
// => 만약, 유효시간 설정 생략 시 웹브라우저 종료되면 쿠키가 삭제됨(= 세션과 동일해짐)
// cookie.setMaxAge(60); // 60초 = 1분
cookie.setMaxAge(60 * 60 * 24); // 60초 * 60분 * 24시간 = 1일
// 3. 서버측에서 생성한 쿠키를 클라이언트로 전송하기 위해
//    response 객체의 addCookie() 메서드를 호출하여 생성된 Cookie 객체를 파라미터로 전달
response.addCookie(cookie);
// --------------------------------------------------
// 새로운 쿠키(cookieName2 - cookieValue2) 생성하기 => 유효시간 1분
Cookie cookie2 = new Cookie("cookieName2", "cookieValue2");
cookie2.setMaxAge(60);
response.addCookie(cookie2);

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키를 생성하는 페이지</h1>
	
	<%-- 생성된 쿠키 확인을 위해 생성한 페이지에서 getXXX() 메서드로 확인(임시) --%>
	<%-- Cookie 객체에 저장된 쿠키는 getXXX() 메서드로 접근 가능 --%>
	<h3>쿠키명 : <%=cookie.getName() %></h3>
	<h3>쿠키값 : <%=cookie.getValue() %></h3>
	<h3>쿠키 유효시간 : <%=cookie.getMaxAge() %></h3>
	<button onclick="location.href='test_use.jsp'">쿠키 확인</button>
</body>
</html>












