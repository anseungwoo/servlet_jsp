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
		/*
		특정 요소에 대한 조작 이벤트
		1. html()
		   - HTML 문서 내에서 지정된 범위(선택자) 안의 모든 요소를 가져오거나 추가하는 함수
		   - 요소를 가져올 때 주석까지 포함해서 가져옴
		   - 단, XML 문서를 대상으로는 사용 불가
		2. text()
		   - html() 함수와 달리 HTML 문서 및 XML 문서 모두 사용 가능
		   - 모든 문자열을 가져오거나 추가 가능
		   - 단, 브라우저마다 줄바꿈이나 공백 등이 달라질 수 있음
		3. empty() 
		   - 지정된 선택자 내의 하위 요소 제거(비움)
		4. remove()
		   - 지정된 선택자와 선택자 내의 하위 요소 모두 제거
		*/
		// h3 태그 내의 HTML 요소 가져오기
// 		var h3Element = $("h3").html(); // 첫번째 h3 태그 요소("제목1" 이라는 텍스트 가져오기)
// 		alert(h3Element); // "제목1" 출력

		// id 선택자 "h3_2" 인 태그의 모든 요소 가져오기
// 		var h3Element = $("#h3_2").html();
// 		alert(h3Element); // "제목2&nbsp;<span>제목2-1</span>&nbsp;<span>제목2-2</span>" 출력
		
		// id 선택자 "h3_2" 인 태그의 모든 텍스트 가져오기(실제 보이는 형태의 텍스트)
// 		var h3Element = $("#h3_2").text();
// 		alert(h3Element); // "제목2 제목2-1 제목2-2" 출력
		
		// ------------------------------------------------------------------------------------
		// html() 함수를 호출하여 "#h3_1" 선택자의 요소 내용 바꾸기(= 태그 그대로 적용 가능)
		// => document.getElementById("선택자").innerHTML 과 동일
// 		$("#h3_1").html("<i>italic 적용된 제목</i>"); // i 태그가 적용된 텍스트 출력됨
		
		// text() 함수를 호출하여 "#h3_1" 선택자의 요소 내용 바꾸기(= 태그 그대로 적용 가능)
// 		$("#h3_1").text("<i>italic 적용된 제목</i>"); // i 태그도 일반 텍스트로 적용되어 출력됨
		
		// ------------------------------------------------------------------------------------
		// 모든 h3 태그의 기존 텍스트에 내용 추가
		// => html() 함수 내에서 익명 함수 구현을 통해 함수 호출이 반복되도록 수행
		// => 이 때, 익명 함수 파라미터로 index 지정 시 해당 요소 인덱스가 전달되며
		//    oldHtml 파라미터는 해당 요소의 원래 내용이 전달됨
		// => 해당 태그에 값을 적용하려면 return 문 사용
// 		$("h3").html(function(index, oldHtml) {
// // 			alert(index + ", " + oldHtml);

// 			// return 문을 사용하여 기존 텍스트 + 새로운 텍스트 값을 리턴하여 변경
// 			return oldHtml + " 입니다.";
// 		});
		
		// ------------------------------------------------------------------------------------
		// empty() 함수를 사용하여 선택자 내의 하위 요소 제거
		// "#h3_2" 태그 내의 모든 하위 요소 제거
		$("#h3_2").empty(); // h3 태그는 남아있음
		
		// remove() 함수로 동일한 작업 수행
// 		$("#h3_2").remove(); // h3 태그도 제거됨
	});
</script>
</head>
<body>
	<h1>jQuery - test4.jsp</h1>
	<div id="wrap">
		<!-- 제목이 표시될 공간 -->
		<h3 id="h3_1">제목1</h3>
		<h3 id="h3_2">제목2&nbsp;<span>제목2-1</span>&nbsp;<span>제목2-2</span></h3>
		<h3 id="h3_3">제목3</h3>
	</div>
	<textarea rows="5" cols="50"></textarea>
	<hr>
	<input type="button" value="시계 표시"> <input type="button" value="시계 제거">
	<div id="timer">
		<!-- 시간이 표시될 공간 -->
	</div>
</body>
</html>












