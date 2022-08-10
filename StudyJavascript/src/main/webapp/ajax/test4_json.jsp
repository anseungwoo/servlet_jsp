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
		// 자바스크립트에서의 객체(클래스 정의 없이 사용할 경우)
// 		var o = {
// 			name: "홍길동",
// 			age: 20
// 		}
// 		// 자바에서 객체 접근 방법과 동일한 방법으로 접근
// 		document.write("이름 : " + o.name + "<br>나이 : " + o.age);
		
		// --------------------------------------------------------------------
		// AJAX 를 활용하여 JSON 데이터를 요청하는 방법
// 		$.ajax({
// 		})
// 		.done(function(data) { // AJAX 요청 성공 시 자동으로 호출되는 콜백 함수(success: 다음에 호출됨)
// 		})
// 		.fail(function() { // 요청 실패 시 자동으로 호출되는 콜백 함수
// 		});
		
		$.ajax({
			type: "get",
			url: "json_data1.txt", // JSON 데이터를 요청할 URL 또는 리소스(= 파일명)
			dataType: "json" // 해당 리소스의 응답 데이터가 JSON 객체라는 의미의 "json" 타입 지정 
		})
		.done(function(data) { // JSON 데이터 요청 성공 시 호출되는 콜백 함수(응답데이터 : data)
			document.write(data + " => " + typeof(data) + " 타입<br>");
			// JSON 객체의 stringify() 함수를 호출하여 JSON 데이터(객체) 전달 시 문자열로 변환
// 			document.write(JSON.stringify(data));
			
			// JSON 객체를 담고 있는 변수 data 에 접근하여 각 객체 속성에 접근 가능(객체명.속성명)
			var name = data.name; // name 속성값을 변수 name 에 저장
			var age = data.age; // age 속성값을 변수 age 에 저장
			document.write("이름 : " + name + ", 나이 : " + age);
		})
		.fail(function() {
			document.write("JSON 데이터 요청 실패!");
		})
		
	});
</script>
</head>
<body>
	
</body>
</html>







