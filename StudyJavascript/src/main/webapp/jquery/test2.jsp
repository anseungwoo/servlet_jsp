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
선택자(Selector)
- 문서 객체 내의 요소를 선택하기 위한 용도로 사용하는 구성 요소
- 자바스크립트에서 사용하는 document.getElementByXXX("선택자명") 메서드를 호출하던 것과 달리
  jQuery 에서는 $("선택자명") 형태로 대상을 지정하므로 문장이 간결해짐
  
< 선택자 사용 기본 문법 >
$("선택자명 또는 *").함수명("속성명", "속성값");

< 지정한 요소에 대한 CSS 속성 변경하는 기본 문법 - css() 함수 사용 >
$("선택자").css("속성명", "속성값");
--------------------------------------------------------------------------------------------
1. 직접 선택자 - 특정 대상(요소)을 직접 지정하기 위한 선택자
  1) 아이디(#) - 페이지 내에서 유일한 요소 => $("#id선택자명")
  2) 클래스(.) - 복수개의 동일한 요소 => $(".class선택자명")
  3) 태그 - 동일한 태그를 같는 복수개의 요소 => $("태그명")
  4) 태그 속성 - 동일한 태그 중 특정 속성 지정 => $("태그명[속성명]")
  5) 태그 속성 값 - 동일한 태그의 동일한 속성 중 특정 값 지정 => $("태그명[속성명=값]")
*/
	// ready 이벤트를 통해 문서 내의 선택자 요소에 접근
	$(function() {
		// 전체 요소에 대한 CSS 속성을 변경 - 모든 요소의 글자색("COLOR" 속성)을 "RED" 로 변경
		$("*").css("color", "red");
		
		// id 선택자(#) 중 "idSelector" 라는 이름을 갖는 요소의 글자색을 "BLUE" 로 변경
		// => document.getElementById("선택자명") 대신 $("#선택자명") 으로 지정
		$("#idSelector").css("color", "blue");
		// "idSelector" 선택자의 "color" 속성에 대한 값 확인하기
		// => $("#선택자명").css("속성명") 으로 확인 가능(속성값 리턴)
// 		alert($("#idSelector").css("color")); // rgb(0, 0, 255) = blue
		
		// class 선택자(.) 중 "classSelector" 라는 이름을 갖는 요소의 글자색을 "ORANGE" 로 변경
		$(".classSelector").css("color", "orange");
		// "classSelector" 선택자의 "color" 속성에 대한 값을 리턴받아 변수 color에 저장 후 출력하기
		var color = $(".classSelector").css("color");
		alert(color); // rgb(255, 165, 0) = orange
		
	});
</script>
</head>
<body>
	<h1>jQuery - test2.jsp</h1>
	<hr>
	<h3 id="idSelector">id 선택자</h3>
	<h3 class="classSelector">class 선택자</h3>
	<h3 class="classSelector">class 선택자2</h3>
	<hr>
	<table border="1">
		<tr><td>번호</td><td>제목</td></tr>
		<tr><td>1</td><td>1번제목</td></tr>
		<tr><td>2</td><td>2번제목</td></tr>
		<tr><td>3</td><td>3번제목</td></tr>
		<tr><td>4</td><td>4번제목</td></tr>
	</table>
	<hr>
	<div id="inputBox">
		<input type="text" value="admin">
		<input type="password" value="1234"><br>
		<textarea rows="5" cols="20" readonly="readonly"></textarea>
		<textarea rows="5" cols="20" id="inputData"></textarea>
	</div>
	<hr>
	<div id="divBox">
		<div>
			1번 div 태그
			<div>1-1번 div 태그</div>
			<div>1-2번 div 태그</div>
		</div>
		<span>span 태그</span>
		<div>2번 div 태그</div>
		<div>
			3번 div 태그
			<div>3-1번 div 태그</div>
			<div>3-2번 div 태그</div>
		</div>
	</div>
	<hr>
	<select id="selectBox">
		<option value="JAVA">JAVA</option>
		<option value="JSP">JSP</option>
		<option value="Spring Framework">Spring Framework</option>
	</select>
	<input type="text" id="selectResult">
</body>
</html>












