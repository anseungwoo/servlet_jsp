<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		// 		$("input[type=button]").click(function() {
		// 			alert("버튼 클릭");
		// 		});

		// 		$(":button").on("click", function() {
		// 			alert("버튼 클릭");
		// 		});
		$(":button").eq(0).on(
				"click",
				function() {
					$("#resultArea").html(
							"아이디 = " + $("input[name=id]").val() + "\n"
									+ "패스워드 = "
									+ $("input[name=password]").val() + "\n"
									+ "선택과목 = "
									+ $("#selectBox > option:selected").val()
									+ "\n");
				});
		$("#clickDiv").on("click", function() {
			$("#clickDiv").append("<div>append() 로 삽입</div>");
		});

		$("#resultArea").on("focus", function() {
			$("#resultArea").html(
					"text focus in");

		});
		$("#resultArea").on("blur", function() {
			$("#resultArea").html(
					"text focus out");

		});
	});
</script>
</head>
<body>

	<h1>jQuery - test8.jsp</h1>

	<div id="inputBox">
		아이디 : <input type="text" name="id"><br> 패스워드 : <input
			type="password" name="password">
	</div>
	<select id="selectBox" name="subject">
		<option value="">선택하세요</option>
		<option value="자바">자바</option>
		<option value="JSP">JSP</option>
		<option value="SPRING">SPRING</option>

	</select>
	<br>
	<textarea rows="5" cols="20" id="resultArea"></textarea>
	<br>
	<input type="button" value="확인">
	<input type="button" value="취소">
	<hr>
	<div id="clickDiv">=============================================================</div>



</body>
</html>