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
		$.ajax({
			type: "get",
			url: "json_data2.txt",
			dataType: "json"
		})
		.done(function(data) {
			document.write("이름 : " + data.name + ", 나이 : " + data.age + ", 아이디 : " + data.id);
		})
		.fail(function() {
			document.write("JSON 데이터 요청 실패!");
		});
	});
</script>
</head>
<body>

</body>
</html>