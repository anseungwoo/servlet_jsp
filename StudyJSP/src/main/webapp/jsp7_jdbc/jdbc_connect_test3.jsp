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
	<h1>jdbc_connect_test3.jsp</h1>
	<%
	/*
	[ JDBC 연결 작업 - 4단계 ]
	1. JDBC 드라이버 로드
	   - java.lang 패키지의 Class 클래스의 static 메서드 forName() 을 호출하여
	     드라이버 클래스가 위치한 패키지명과 클래스명을 문자열로 전달하여 클래스 로드
	     ex) MySQL : com.mysql.cj.jdbc.Driver
       
	   < 문법 >
	   Class.forName("드라이버클래스");
	   
	2. DB 연결(접속)
	   - java.sql 패키지의 DriverManager 클래스의 static 메서드 getConnection() 을 호출하여
	     DB 접속 시도 후 연결(접속)이 성공하면 java.sql.Connection 타입 객체 리턴
	   - 파라미터로 DB 접속을 위한 URL, 계정명, 패스워드를 문자열로 전달
	   
	   < URL 형식 >
	   MySQL - jdbc:mysql://접속할주소:포트번호/DB명
	   ex) jdbc:mysql://localhost:3306/study_jsp2
	   
	3. SQL 구문 작성 및 전달
	  - 현재 1단계, 2단계 과정을 통해 DB에 접속된 상태에서
	    접속 정보를 담고 있는 Connection 객체를 통해 데이터베이스 관련 작업 수행 가능
	    (반드시 2단계 과정에서 Connection 타입 변수에 객체를 리턴받아 저장되어 있어야함)
	  - Connection 객체에 prepareStatement() 메서드를 호출하여 실행할 SQL 구문 전달
	  - SQL 구문을 관리하는 java.sql.PreparedStatement 타입 객체 리턴됨
	  - 단, 아직 구문 실행하는 단계는 아니다! (= 실행 준비 단계)

	  < 문법 >
	  PreparedStatement pstmt = con.prepareStatement("SQL구문");
	  
	4. SQL 구문 실행 및 결과 처리
	  - 3단계에서 리턴받은 PreparedStatemenet 객체의 
	    executeXXX() 메서드를 호출하여 전달받은 SQL 구문 실행
	    1) executeUpdate() - DB 에 조작을 가하는 쿼리문을 실행하는 용도의 메서드
	                         => 주로, DML 중 INSERT, UPDATE, DELETE 와
	                            DDL 중 CREATE, ALTER, DROP 등 실행하는 용도
	                         => 작업 실행 후 결과값이 int 타입으로 리턴되는데
	                            이는, 영향을 받은 레코드 수가 리턴됨(DML 한정, 나머지는 0)
	    2) executeQuery() - DB 에 조작을 가하지 않는 쿼리문(SELECT)을 실행하는 용도의 메서드
	                        => 작업 실행 후 조회된 결과 테이블을 
	                           java.sql.ResultSet 타입 객체로 리턴함
	*/
	
	// 작업에 사용할 정보 문자열 변수에 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp2";
	String username = "root";
	String password = "1234";
	
	// 1단계. JDBC 드라이버 로드
	Class.forName(driver);
	out.println("<h3>드라이버 로드 성공!</h3>");
		
	// 2단계. DB 연결
	Connection con = DriverManager.getConnection(url, username, password);
	out.println("<h3>DB 연결 성공!</h3>");
	
	// 3단계. SQL 구문 작성 및 전달
	// 1) SQL 구문 작성	
// 	String sql = "CREATE TABLE test (idx INT)";
// 	String sql = "CREATE TABLE test2 (name VARCHAR(10))";
	String sql = "CREATE TABLE test3 (idx INT, name VARCHAR(10))";
// 	String sql = "DROP TABLE test3";
	
	// 2) Connection 객체의 prepareStatement() 메서드를 호출하여 SQL 구문 전달
    //    => 파라미터 : SQL 구문(String)   리턴타입 : java.sql.PreparedStatement
    PreparedStatement pstmt = con.prepareStatement(sql);
    
    // 4단계. SQL 구문 실행 및 결과 처리
    // => CREATE, ALTER, DROP, INSERT, UPDATE, DELETE 등의 구문 실행을 위해 
    //    PreparedStatement 객체의 executeUpdate() 메서드 실행 => int 타입 리턴
    pstmt.executeUpdate();
    out.println("<h3>SQL 구문 실행 성공!</h3>");
	%>
</body>
</html>

















