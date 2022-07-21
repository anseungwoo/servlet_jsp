<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest2_form.jsp</h1>
	<!-- form 태그를 사용하여 responseTest2_result.jsp 페이지로 GET 방식 요청 -->
	<!-- 아이디(name 속성 : id), 패스워드(name 속성 : passwd) 입력, submit 버튼(로그인) 생성 -->
	<form action="responseTest2_result.jsp" method="get">
		<table border="1">
			<tr>
				<th>아이디</th><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>패스워드</th><td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>







