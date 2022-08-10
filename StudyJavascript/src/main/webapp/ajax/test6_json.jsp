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
			url: "json_data3.txt",
			dataType: "json"
		})
		.done(function(data) {
// 			$("#resultArea").html(data + " : " + typeof(data));
			// [object Object],[object Object],[object Object] : object => 배열에 객체 3개 저장됨
			
			// 전송된 데이터를 출력할 테이블 표시
			
			// 전송된 data 내에 있는 JSON 객체가 저장된 배열에 접근하기
			// => 배열은 대괄호[] 형식으로 표기하며, 자바와 동일한 방법인 인덱스로 접근함
			// => append() 함수를 사용하여 div 태그(#resultArea) 내의 table 태그 마지막 요소로 추가
			// 1) 인덱스를 사용하여 data 배열의 객체 3개를 접근하는 방법
// 			$("#resultArea > table").append(
// 				"<tr>" + 
// 				"<td>" + data[0].name + "</td>" +
// 				"<td>" + data[0].age + "</td>" +
// 				"<td>" + data[0].id + "</td>" +
// 				"</tr>"		
// 			);
		
// 			$("#resultArea > table").append(
// 					"<tr>" + 
// 					"<td>" + data[1].name + "</td>" +
// 					"<td>" + data[1].age + "</td>" +
// 					"<td>" + data[1].id + "</td>" +
// 					"</tr>"		
// 			);
			
// 			$("#resultArea > table").append(
// 					"<tr>" + 
// 					"<td>" + data[2].name + "</td>" +
// 					"<td>" + data[2].age + "</td>" +
// 					"<td>" + data[2].id + "</td>" +
// 					"</tr>"		
// 			);

			// 2) 반복문(for)을 사용하여 JSON 객체가 파싱된 배열(data)에 접근하여 각 데이터 출력
			// => 단, table 태그가 복수개 일 경우 첫번째 테이블을 선택
			for(var i = 0; i < data.length; i++) {
				$("#resultArea > table").eq(0).append(
						"<tr>" + 
						"<td>" + data[i].name + "</td>" +
						"<td>" + data[i].age + "</td>" +
						"<td>" + data[i].id + "</td>" +
						"</tr>"		
				);
			}
		})
		.fail(function() {
			document.write("JSON 데이터 요청 실패!");
		});
	});
	
	// ready 이벤트 - AJAX 요청을 통해 json_data4.txt 에 저장된 JSON 데이터를 파싱하여 출력
	// => table 태그 중 두번째 태그에 표시
	$(function() {
		$.ajax({
			type: "get",
			url: "json_data4.txt",
			dataType: "json"
		})
		.done(function(data) {
			for(var i = 0; i < data.length; i++) {
				$("#resultArea > table").eq(1).append(
					"<tr>" + 
					"<td>" + data[i].accountNo + "</td>" +
					"<td>" + data[i].ownerName + "</td>" +
					"<td>" + data[i].balance + "</td>" +
					"<td>" + data[i].agreeRcvSpam + "</td>" +
					"</tr>"
				);
			}
		})
		.fail(function() {
			$("#resultArea > table").eq(1).append("<tr><td colspan='4'>JSON 데이터 요청 실패!</td></tr>");
		});
	});
</script>
</head>
<body>
	<h1>test6_json.jsp</h1>
	<div id="resultArea">
		<h3>회원정보</h3>
		<table border="1">
			<tr>
				<th width="150">이름</th><th width="100">나이</th><th width="150">아이디</th>
			</tr>
		</table>
		<hr>
		<h3>고객 계좌 정보</h3>
		<table border="1">
			<tr>
				<th width="150">계좌번호</th>
				<th width="100">예금주명</th>
				<th width="100">현재잔고</th>
				<th width="100">정보수신동의</th>
			</tr>
		</table>
	</div>
</body>
</html>













