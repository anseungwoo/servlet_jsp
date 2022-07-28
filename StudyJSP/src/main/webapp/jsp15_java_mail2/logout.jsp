<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 객체 초기화
session.invalidate();

// 자바스크립트를 사용하여 "로그아웃 완료" 메세지 출력 후 main.jsp 로 이동
%>
<script>
	alert("로그아웃 완료!");
	location.href = "../main.jsp";
</script>