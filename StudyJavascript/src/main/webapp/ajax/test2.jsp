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
		$("#btnLogin").on("click", function() {
			// AJAX 를 사용하여 test2_result.jsp 페이지로 로그인 작업 요청
			$.ajax({
				type: "post",
				url: "test2_result.jsp",
// 				url: "http://localhost:8080/MVC_Board/MemberLoginPro.me", // 서블릿 주소 요청 가능
				data: $("form").serialize(),
				dataType: "text",
				success: function(response) {
					$("#resultArea").html(response);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>AJAX - test2.jsp</h1>
	<h1>로그인</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>아이디</th><td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<th>패스워드</th><td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="로그인" id="btnLogin"></td>
				
			</tr>
		</table>
		<hr>
		<div id="resultArea"><!-- AJAX 처리 결과 출력 위치 --></div>
	</form>
</body>
</html>













