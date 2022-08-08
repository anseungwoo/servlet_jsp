<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function getTime() {
		var now = new Date();
		var hour = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();

		return hour + " : " + min + " : " + sec;

	}

	$(function() {
		var interval = null;
		var isStop = false;
		$("input[type=button]").eq(0).on("click", function() {
			isStop = false;
			interval = setInterval(function() {
				if (!isStop) {
					$("#timer").html("<div>" + getTime() + "</div>");
				} else {
					
				}
			}, 1000)
		});
		$("input[type=button]").eq(1).on("click", function() {
			clearInterval(interval);
			$("#timer").empty();

		});
	});
</script>
</head>
<body>
	<h1>jQuery - test10.jsp</h1>
	<input type="button" value="시계 표시">
	<input type="button" value="시계 제거">
	<div id="timer">
		<!-- 시간이 표시될 공간 -->
	</div>
</body>
</html>












