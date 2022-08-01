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
		// css() 함수
		// - css("속성명", "속성값") 형식으로 호출 시 해당 CSS 속성값을 변경
		// - 속성명만 지정할 경우 해당 CSS 속성값을 리턴
// 		alert($("h3").css("color"));
		
		// h3 태그 중 첫번째 요소의 color 속성값을 초록색으로 변경
		$("h3:first").css("color", "green");
		
		// css() 함수 내에서 구현되는 익명 함수
		// $("선택자명").css("속성명", function(index) {
		// 		// 대상 태그를 차례대로 접근하면서 해당 요소의 인덱스가 파라미터에 전달됨(반복문으로 동작)	
		// });
		
// 		$("h3").css("color", function(index) {
// 			// h3 태그가 3개이며, 해당 태그를 차례대로 접근하는 작업 반복
// 			alert(index); // 0, 1, 2 인덱스 접근하여 인덱스 값 출력
// 		});
		
		// $("선택자명").css("속성명", function(index, value) {
		// 		// 대상 태그를 차례대로 접근하면서 해당 요소의 인덱스와 값이 파라미터에 전달됨(반복문으로 동작)
		// });
// 		$("h3").css("color", function(index, value) {
// 			// h3 태그가 3개이며, 해당 태그를 차례대로 접근하는 작업 반복
// 			// => h3 태그들의 "color" 속성에 접근하여 차례대로 값(value) 출력(초록, 검정, 검정)
// 			alert(index + ", " + value); // 0, 1, 2 인덱스 접근하여 인덱스에 해당하는 color 속성값 출력
// 		});
		
		var colorValue = ["red", "green", "blue"]; // 글자색상을 저장하는 배열
		var bgColorValue = ["cyan", "magenta", "yellow"]; // 배경색상을 저장하는 배열
		
		// h3 태그의 color 속성값을 차례대로 한꺼번에 다른색으로 변경하기(배열 활용)
		// => 대상의 값을 변경하기 위해서는 return 문을 사용하여 값을 리턴하면 
		//    해당 요소의 속성값 변경 가능
// 		$("h3").css("color", function(index) {
// // 			return "red"; // 모든 h3 태그 요소의 color 속성값이 red 로 변경됨
			
// 			// 함수 파라미터로 전달되는 index 값(0, 1, 2)을 배열의 인덱스로 활용 가능
// 			return colorValue[index]; // 차례대로 red, green, blue 색상으로 변경됨
// 		});
		
		// h3 태그의 "background" 속성값을 차례대로 bgColorValue 배열 값으로 변경
// 		$("h3").css("background", function(index) {
// 			return bgColorValue[index];
// 		});
		
		// 동일한 대상에 복수개의 속성을 변경하는 경우
		// $("선택자").css({속성1:함수(index){}, 속성2:함수(index){}})
		$("h3").css({
			color: function(index) {
				return colorValue[index];
			},
			background: function(index) {
				return bgColorValue[index];
			}
		});
	});
</script>
</head>
<body>
	<h1>jQuery - test3.jsp</h1>
	<h3>제목1</h3>
	<h3>제목2</h3>
	<h3>제목3</h3>
</body>
</html>