<%@page import="jsp9_jdbc.TestDAO"%>
<%@page import="jsp9_jdbc.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

int idx = Integer.parseInt(request.getParameter("idx")); 

TestDAO dao = new TestDAO();
TestDTO dto = new TestDTO();
dto=dao.selectInfo(idx);


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp 회원정보</h1>
	<h3>번호 : <%=dto.getIdx() %></h3>
	<h3>이름 : <%=dto.getName() %></h3>



	
</body>
</html>











