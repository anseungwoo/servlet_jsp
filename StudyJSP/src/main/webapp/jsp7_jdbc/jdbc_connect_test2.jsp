<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test2.jsp</h1>
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
	4. SQL 구문 실행 및 결과 처리
	*/
	
	// 1단계. JDBC 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("<h3>드라이버 로드 성공!</h3>");
	
	// 2단계. DB 연결
// 	DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp2", "root", "1234");
	// => DB 연결 성공 시 java.sql.Connection 타입 객체가 리턴되므로 변수에 저장하여 사용
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/study_jsp2", "root", "1234");
	out.println("<h3>DB 연결 성공!</h3>");
	// 프로토콜 틀림 : java.sql.SQLException: No suitable driver found for jdbc:mysqlㅁ://localhost:3306/study_jsp2
	// URL 주소 틀림 : java.net.UnknownHostException: localhost
	// 포트번호 틀림 : java.net.ConnectException: Connection refused: connect
	// DB 명 틀림 : java.sql.SQLSyntaxErrorException: Unknown database 'study_jsp22'
	// 계정 또는 패스워드 틀림 : javax.servlet.ServletException: java.sql.SQLException: Access denied for user 'root'@'localhost' (using password: YES)
	
	// 2단계 과정까지는 데이터베이스 제품별로 정보가 달라질 수 있는 부분이며
	// 3단계 과정부터는 실제 데이터베이스 내에서 SQL 구문을 실행하므로 공통적인 작업에 해당함
	%>
</body>
</html>













