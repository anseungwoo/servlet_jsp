<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkId() {
		// 중복확인 버튼 클릭 시 checkId() 함수를 호출하여 아이디 중복 여부 체크
		// => 입력된 아이디가 "admin" 일 경우 div 영역(checkIdResult)에 "이미 사용중인 아이디" 출력,
		//    아니면, "사용 가능한 아이디" 출력
		let divCheckIdResult = document.getElementById("checkIdResult");
		
// 		if(document.fr.id.value == "admin") { // form 태그의 id 요소 값을 가져와서 비교
// 			divCheckIdResult.innerHTML = "이미 사용중인 아이디";
// 			divCheckIdResult.style.color = "RED";
// 			document.fr.id.select(); // 입력 항목 포커스 요청 및 항목 선택(블럭 지정)
// 		} else {
// 			divCheckIdResult.innerHTML = "사용 가능한 아이디<br>" 
// 						+ "<input type='button' value='아이디 사용' onclick='useId()'>";
// 			divCheckIdResult.style.color = "GREEN";
// 		}

		// 임시) 입력된 아이디는 무조건 사용 가능하다고 가정
		divCheckIdResult.innerHTML = "사용 가능한 아이디<br>" 
									+ "<input type='button' value='아이디 사용' onclick='useId()'>";
		divCheckIdResult.style.color = "GREEN";
	}
	
	function useId() {
		// 아이디 사용 버튼 클릭 시
		// 부모창(join_form.html)의 폼 영역 내의 ID 입력창에 현재 입력된 아이디를 표시
		// => window.opener.document.폼이름.요소이름.value = 값; 형태로 표시 가능
		window.opener.document.fr.id.value = document.fr.id.value; // 부모창 ID 영역에 표시
		window.close(); // 창 닫기
	}
</script>
</head>
<body>
	<h1>ID 중복 체크</h1>
	<form action="" name="fr">
		<input type="text" name="id">
		<input type="button" value="중복확인" onclick="checkId()">
		<div id="checkIdResult"></div>
	</form>
</body>
</html>











    