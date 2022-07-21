<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML 주석. 이 주석은 웹브라우저의 소스보기 기능을 통해 확인 가능함. -->
	<h1>test.jsp</h1>
	<%-- JSP 주석. 이 주석은 웹브라우저의 소스보기 기능을 통해 확인 불가능함. --%>
	<%-- JSP 코드가 포함될 경우 HTML 주석으로는 주석 처리가 불가능하므로 반드시 JSP 주석으로 처리 --%>
	<%
	// 이 부분은 자바 코드가 기술되는 부분으로 웹브라우저에서 코드가 표시되지 않습니다.
	Timestamp now = new Timestamp(System.currentTimeMillis()); // 현재 시각 표시하는 코드
	%>
	<h3>현재 시각 : <%=now %></h3>
	
	<!-- now 변수 출력하는 JSP 코드에 HTML 주석 처리 시, 화면 출력은 안되나 서버에서 코드 실행됨 -->
	<!-- <h3>현재 시각2 : <%=now %></h3> -->
	<!-- <h3>현재 시각2 : 2022-04-29 10:18:53.776</h3> 형태로 웹브라우저에 전송됨 -->
	
	<%-- JSP 주석 처리 시, 서버에서 실행하지 않고, 웹브라우저로 전송도 하지 않음 --%>
	<%-- <h3>현재 시각 : <%=now %></h3> --%>
</body>
</html>












