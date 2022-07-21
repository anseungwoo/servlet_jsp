<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 현재 페이지의 언어 설정값을 한국어("ko-kr") 로 기본 설정
String language = "ko-kr";

// 쿠키 중 "language" 쿠키가 있을 경우 해당 쿠키의 값을 language 변수에 저장
Cookie[] cookies = request.getCookies();
if(cookies != null) {
	for(Cookie cookie : cookies) {
		if(cookie.getName().equals("language")) {
			language = cookie.getValue();
		}
	}
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 활용한 설정 정보 관리</title>
</head>
<body>
	<%-- language 변수에 저장된 언어 설정값에 따라 각국의 언어로 웹사이트 표시 --%>
	<%-- "ko-kr" 이면 한국어, "en-us" 이면 영어로 표시 --%>
	<%if(language.equals("ko-kr")) { %>
		<h1>글로벌 웹사이트</h1>
		<h1>안녕하세요. 쿠키 예제입니다.</h1>
	<%} else if(language.equals("en-us")) { %>
		<h1>Global Website</h1>
		<h1>Hi, This is Cookie example.</h1>
	<%} %>
	
	<h3>현재 설정 언어 : <%=language %></h3>
	<%-- 버튼 2개 생성(한국어, 영어) 후 test2_set.jsp 페이지로 포워딩(파라미터로 언어설정값 전달) --%>
	<button onclick="location.href='test2_set.jsp?lang=ko-kr'">한국어</button>
	<button onclick="location.href='test2_set.jsp?lang=en-us'">영어</button>
</body>
</html>

















