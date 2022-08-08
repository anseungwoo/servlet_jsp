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
		$("#wrap_append").append("<div>append() 로 삽입</div>");
		
		
		$("#wrap_prepend").prepend("<div>prepend() 로 삽입</div>");
		$("#wrap_after").after("<div>after() 로 삽입</div>");
		$("#wrap_before").before("<div>before() 로 삽입</div>");
		
		
		
		$("#ta").val($("#wrap").html());
	});
</script>
</head>
<body>
	<h1>jQuery - test5.jsp</h1>
	<div id="wrap">
		<div id="wrap_append">
			<div>
				<div>div 태그 1</div>
				<div>div 태그 2</div>
			</div>
		</div>
		<hr>
		
			<div id="wrap_prepend">
				<div>
					<div>div 태그 1</div>
					<div>div 태그 2</div>
				</div>
			</div>
			<hr>
			<div id="wrap_after">
				<div>
					<div>div 태그 1</div>
					<div>div 태그 2</div>
				</div>
			</div>
			<hr>
			<div id="wrap_before">
				<div>
					<div>div 태그 1</div>
					<div>div 태그 2</div>
				</div>
			</div>
	</div>
	<textarea rows="20" cols="100" id="ta"></textarea>
</body>
</html>