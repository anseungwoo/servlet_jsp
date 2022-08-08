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
		// 아이디 입력 항목이 변할 때("change" 이벤트) 이벤트 처리 수행
		$("#id").on("change", function() {
			// AJAX 를 활용하여 test3_result.jsp 페이지로 아이디 전달
			// => 성공 시 응답 데이터를 "checkIdResult" 선택자 영역에 표시
			$.ajax({
				type: "post",
				url: "test3_result.jsp",
				data: {
					id: $("#id").val()
				},
				dataType: "text",
				success: function(response) {
					$("#checkIdResult").html(response);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>AJAX - test3.jsp</h1>
	<h1>회원가입</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td width="400">
					<input type="text" id="id" name="id" required="required">
					<span id="checkIdResult"></span>
				</td>
			</tr>
			<tr>
				<th>패스워드</th><td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="회원가입" id="btnLogin"></td>
				
			</tr>
		</table>
		<hr>
		<div id="resultArea"><!-- AJAX 처리 결과 출력 위치 --></div>
	</form>
</body>
</html>













