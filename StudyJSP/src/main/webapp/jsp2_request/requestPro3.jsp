<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro3.jsp - 회원 가입 처리</h1>
	
	<%
	// 만약, POST 방식 요청일 경우 한글 처리 필수!
	request.setCharacterEncoding("UTF-8");
	
	// 폼 파라미터 데이터 가져와서 변수에 저장
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
// 	String jumin1 = request.getParameter("jumin1");
// 	String jumin2 = request.getParameter("jumin2");
// 	String email1 = request.getParameter("email1");
// 	String email2 = request.getParameter("email2");
	// 만약, 데이터베이스 저장을 위해 주민번호 또는 E-Mail 을 하나의 문자열로 결합할 경우
	String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	
	String job = request.getParameter("job");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby"); // 복수개의 항목이므로 주의!
	// 만약, 데이터베이스 저장을 위해 취미를 하나의 문자열로 결합할 경우
	// ex) "게임 등산" 또는 "게임/등산/"
	
	String content = request.getParameter("content");
	%>
	
	<!-- 변수에 저장된 폼 데이터 출력 -->
	<table border="1">
		<tr><td>이름</td><td><%=name %></td></tr>
		<tr><td>ID</td><td><%=id %></td></tr>
		<tr><td>비밀번호</td><td><%=passwd %></td></tr>
		<tr><td>주민번호</td><td><%=jumin %></td>
		<tr><td>E-Mail</td><td><%=email %></td>
		<tr><td>직업</td><td><%=job %></td>
		<tr><td>성별</td><td><%=gender %></td>
		<tr>
			<td>취미</td>
			<td>
				<%
				for(int i = 0; i < hobbies.length; i++) {
					out.println(hobbies[i]);
				}
				%>
			</td>
		</tr>
		<tr><td>가입동기</td><td><%=content %></td>
	</table>
</body>
</html>













