<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식일 때 request 객체에 대한 한글 인코딩 처리
request.setCharacterEncoding("UTF-8");

// updateForm.jsp 페이지로부터 전달받은 폼파라미터(이름, 나이) 변수에 저장 및 출력
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age")); // String -> int 로 변환 필수!
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updatePro.jsp</h1>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<%
	// test8_1 테이블에서 이름이 일치하는 레코드의 나이를 수정
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
	
	// 3단계. SQL 작성 및 전달
	String sql = "UPDATE test8_1 SET age=? WHERE name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, age);
	pstmt.setString(2, name);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int updateCount = pstmt.executeUpdate();
	out.println("<h3>" + updateCount + " 개 레코드 수정 성공!</h3>");
	%>
	
</body>
</html>










