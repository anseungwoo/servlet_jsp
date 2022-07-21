<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// URL 파라미터로 전달된 lang 파라미터값(언어설정값)을 가져와서 language 변수에 저장 후
// 쿠키 생성 시 "language" 라는 이름으로 언어설정값 저장(유효시간 1일로 설정)
// => test2.jsp 페이지로 포워딩
String language = request.getParameter("lang");

if(language == null) {
	language = "ko-kr";
}

Cookie cookie = new Cookie("language", language);
cookie.setMaxAge(60 * 60 * 24);

response.addCookie(cookie);

response.sendRedirect("test2.jsp");
%>











