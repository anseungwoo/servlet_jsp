<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//test8_2 테이블의 모든 레코드 조회 후 출력
// DB 작업에 필요한 문자열 선언
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp2";
String user = "root";
String password = "1234";

// 1단계. 드라이버 로드
Class.forName(driver);
System.out.println("드라이버 로드 성공!");

// 2단계. DB 연결
Connection con = DriverManager.getConnection(url, user, password);
System.out.println("DB 연결 성공!");

// 3단계. SQL 구문 작성 및 전달
String sql = "SELECT * FROM test8_2";
PreparedStatement pstmt = con.prepareStatement(sql);

// 4단계. SQL 구문 실행 및 결과처리
ResultSet rs = pstmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>select.jsp</h1>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>ID</th>
			<th>비밀번호</th>
			<th>주민번호</th>
			<th>E-Mail</th>
			<th>직업</th>
			<th>성별</th>
			<th>취미</th>
			<th>가입동기</th>
		<tr>
		<%
		while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("name") %></td>
				<td><a href="select3.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a></td>
				<td><%=rs.getString("passwd") %></td>
				<td><%=rs.getString("jumin")%></td>
				<td><%=rs.getString("email")%></td>
				<td><%=rs.getString("job") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getString("hobby") %></td>
				<td><%=rs.getString("content") %></td>
			<tr>
			<%
		}
		
		// 사용 완료 후 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		%>
	</table>
</body>
</html>


















