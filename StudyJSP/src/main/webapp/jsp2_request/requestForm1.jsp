<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm1.jsp</h1>
	<!-- 
	form 태그
	1) action 속성 : submit 동작에 의해 폼 태그 내의 파라미터(= 폼 파라미터)를
	                 모두 request 객체에 저장한 뒤 action 속성에 지정된 페이지(또는 파일)로 이동
	                 ex) submit 버튼 클릭 시 requestPro1.jsp 페이지로 이동
	2) method 속성 : form 태그에 의해 새 페이지로 요청 시 요청 방식을 결정
	   - GET 방식(method="get" 또는 생략 또는 하이퍼링크 또는 URL 직접 입력하여 이동할 경우)
	     => 폼 파라미터를 주소(URL)에 포함시켜 전달하며, 본문(body)가 없어도 전송 가능함
	        따라서, POST 방식에 비해 전송 속도가 빠름
	     => 단, URL 에 포함시키므로 HTTP 헤더 길이 제한으로 인해 전송 데이터 길이에 제한이 있음
	        (주로, 적은 양의 데이터를 전송하는 용도로 사용 가능)
	   - POST 방식(method="post" 를 지정했을 경우)    
	     => 폼 파라미터를 헤더가 아닌 본문(Body) 영역에 포함하여 전송하므로
	        URL 에 파라미터가 노출되지 않으며, 전송 데이터 길이에 제한이 없음
	     => 주로, 대량의 폼 데이터를 전송하는 용도로 사용
	     => 한글 등(영문자, 숫자, 일부 특수문자 제외)의 문자데이터 전달 시 깨지는 현상 발생
	        반드시 별도의 한글 인코딩 처리가 필수!
	-->
	
	<!-- 데이터를 입력받기 위한 폼 생성(= form 태그 사용) -->
	<form action="requestPro1.jsp" method="get"> <!-- GET 방식 지정 -->
<!-- 		<form action="requestPro1.jsp" method="post"> POST 방식 지정 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="male">남
					<input type="radio" name="gender" value="female">여
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="게임">게임
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전송">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>













