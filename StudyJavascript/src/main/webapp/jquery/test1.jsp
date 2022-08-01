<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 jQuery 라이브러리 등록 -->
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	// Load 이벤트 처리 방법
// 	$(window).on("load", function() {
// 		alert("Load 이벤트!");
// 	});
	// ----------------------------------------------------------
	// 첫번째 Ready 이벤트 처리 방법
// 	jQuery(document).ready(function() {
// 		alert("Ready 이벤트 1번 방법!");
// 	});
	
	// 두번째 Ready 이벤트 처리 방법 - jQuery 객체명을 $ 기호로 대체
// 	$(document).ready(function() {
// 		alert("Ready 이벤트 2번 방법!");
// 	});
	
	// 세번째 Ready 이벤트 처리 방법 - document 객체 지정 및 ready 이벤트 함수 호출 생략
	$(function() {
		alert("Ready 이벤트 3번 방법!");
	});
</script>
</head>
<body>
	<h1>jQuery - test1.jsp</h1>
	<img src="1.jpg" width="300" height="300">
</body>
</html>














