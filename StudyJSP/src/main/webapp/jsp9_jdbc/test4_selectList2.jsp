<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Test8_1DAO dao = new Test8_1DAO();
ArrayList<Test8_1DTO> dtolist = dao.selectList2();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp ArrayList 회원정보리스트</h1>

	<h3>배열의 크기 : <%=dtolist.size() %></h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>취미</th>
		</tr>
		<%for (Test8_1DTO i : dtolist) {%>
		<tr>
			<td><%=i.getName() %></td>
			<td><%=i.getAge() %></td>
			<td><%=i.getGender() %></td>
			<td><%=i.getHobby() %></td>
		</tr>
		<%}%>
<%-- 		<%for(int i=0;i<dtolist.size();i++) {%> --%>
<!-- 		<tr> -->
<%-- 			<td><%=dtolist.get(i).getName() %></td> --%>
<%-- 			<td><%=dtolist.get(i).getAge() %></td> --%>
<%-- 			<td><%=dtolist.get(i).getGender() %></td> --%>
<%-- 			<td><%=dtolist.get(i).getHobby() %></td> --%>
<!-- 		</tr> -->
<%-- 		<%}%> --%>
	
	</table>
</body>
</html>