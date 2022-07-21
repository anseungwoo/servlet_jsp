<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test1.jsp</h1>
	<%
	/*
	[ JDBC 연결 작업 - 4단계 ]
	1. JDBC 드라이버 로드
	   - java.lang 패키지의 Class 클래스의 static 메서드 forName() 을 호출하여
	     드라이버 클래스가 위치한 패키지명과 클래스명을 문자열로 전달하여 클래스 로드
	     ex) MySQL : com.mysql.cj.jdbc.Driver
       < 문법 >
	   Class.forName("드라이버클래스");
	2. DB 연결
	3. SQL 구문 작성 및 전달
	4. SQL 구문 실행 및 결과 처리
	*/
	
	// 1단계. JDBC 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("<h3>드라이버 로드 성공!</h3>");
	// => 만약, 드라이버 클래스가 없거나 위치 또는 이름이 틀렸을 경우 오류 발생!
	//    (java.lang.ClassNotFoundException: com.mysql.cj.jdbc.Drive)
	%>
</body>
</html>











