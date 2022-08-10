<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	/*
	AJAX(Asynchronous Javascript And XML, 비동기식 자바스크립트 & XML)
	- 웹페이지(브라우저)의 갱신 없이도 화면 상의 요소를 다룰 수 있는 자바스크립트 라이브러리(기술)
	- 데이터베이스 등의 작업 요청 시에도 요청된 응답이 돌아올 때까지 기다리지 않고
	  다른 작업을 수행하면서 요청에 대한 응답이 돌아오면 해당 응답 처리
	- 주로, 아이디 및 패스워드 검증 등의 작업에 활용
	
	< 기본 문법 >
	$.ajax();
	*/
	
	$(function() {
		$("#btnLogin").on("click", function() {
			// AJAX 구현
// 			$.ajax({
// 				type: "post", // AJAX 로 요청할 요청 방식(GET or POST) 지정
// 				url: "test1_result.jsp", // AJAX 로 요청할 페이지 지정
// 				data: { // 전송할 데이터(파라미터) 지정(복수개이므로 중괄호로 묶음)
// 					// 폼 데이터를 가져와서 파라미터로 표현하는 경우
// 					// 파라미터명: 데이터 => 형식으로 지정
// 					id: $("#id").val(), // id 선택자의 value 속성값 가져와서 id 파라미터로 저장
// 					passwd: $("#passwd").val() // passwd 선택자의 value 속성값 가져와서 passwd 파라미터로 저장
// 				},
// 				dataType: "text", // 전송하는 데이터에 대한 타입 지정(일반 데이터는 text)
// 				success: function(response) { // 요청에 대한 처리 성공 시(= 정상 응답) 처리할 함수 정의
// 					// 익명 함수 파라미터로 응답 데이터가 전달됨(처리 페이지의 응답 결과)
// 					// resultArea 선택자 영역에 응답 데이터(response) 출력
// 					$("#resultArea").html(response);
// 				},
// 				error: function(xhr, textStatus, errorThrown) { // 요청에 대한 처리 실패 시(= 에러 발생 시)
// 					$("#resultArea").html(
// 							"xhr = " + xhr + "<br>textStatus = " + textStatus + "<br>errorThrown = " + errorThrown
// 					);
// 				}
// 			});
			
			// 폼 데이터를 하나씩 별도로 접근하지 않고 폼 데이터 전체를 가져오는 방법
			// => $(폼선택자).serialize(); 형식으로 호출 시 폼 데이터 전체를 파라미터화 시킴
			//    (파라미터화 된 데이터 전체가 문자열로 리턴)
// 			$.ajax({
// 				type: "get",
// 				url: "test1_result.jsp",
// 				data: $("form").serialize(), // ex) "id=admin&passwd=1234" 형식으로 전달됨
// 				dataType: "text",
// 				success: function(response) {
// 					$("#resultArea").html(response);
// 				}
// 			});
		
			// 폼 데이터들을 별도의 변수에 문자열로 저장할 경우
			var formData = $("form").serialize();
			$.ajax({
				type: "get",
				url: "test1_result.jsp",
				data: formData, // 전송할 데이터로 변수명 지정
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
	<h1>AJAX - test1.jsp</h1>
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













