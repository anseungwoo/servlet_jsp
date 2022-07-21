<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String hobby = "";
String[] hobbies = request.getParameterValues("hobby");
for (String item : hobbies) {
	hobby += item + "/";
}
Test8_1DTO dto = new Test8_1DTO();
dto.setAge(age);
dto.setGender(gender);
dto.setHobby(hobby);
dto.setName(name);
Test8_1DAO dao = new Test8_1DAO();
int insertCount = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	<h3>
		이름 :
		<%=dto.getName()%></h3>
	<h3>
		나이 :
		<%=dto.getAge() %></h3>
	<h3>
		성별 :
		<%=dto.getGender()%></h3>
	<h3>
		취미 :
		<%=dto.getHobby()%></h3>

	<%
	if (insertCount > 0) {
	%>
	<h3>INSERT 작업 성공!</h3>
	<%
	} else {
	%>
	<h3>INSERT 작업 실패!</h3>
	<%
	}
	%>
	<button onclick="location.href='test3.jsp?name=<%=dto.getName() %>'">투가된 회원 정보 확인</button>
</body>
</html>










