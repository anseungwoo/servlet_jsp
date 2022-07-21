<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_test5_2.jsp</h1>
	<%
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
	
	// --------------------------------------------------------------------------
	// 3단계. SQL 구문 작성 및 전달
	// test 테이블의 idx 컬럼 값이 99 인 레코드를 찾아 100 으로 수정
	int oldIdx = 99, idx = 100;
	String sql = "UPDATE test SET idx=? WHERE idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx); // 첫번째 파라미터(교체할 데이터) 설정
	pstmt.setInt(2, oldIdx); // 두번째 파라미터(검색할 데이터) 설정
    
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int updateCount = pstmt.executeUpdate();
	out.println("<h3>" + updateCount + " 개 레코드 수정 성공!</h3>");
	%>
</body>
</html>


















