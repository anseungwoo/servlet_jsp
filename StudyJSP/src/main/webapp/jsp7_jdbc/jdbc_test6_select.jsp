<%@page import="java.sql.ResultSet"%>
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
	<h1>jdbc_test6_select.jsp</h1>
	<%
	// test3 테이블의 모든 레코드 조회 - SELECT 구문 사용
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
	String sql = "SELECT * FROM test3";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	// SELECT 구문 실행을 위해 PreparedStatement 객체의 executeQuery() 메서드 호출
	// => 리턴타입 : java.sql.ResultSet
	ResultSet rs = pstmt.executeQuery();
	/*
	조회 결과 테이블을 ResultSet 타입으로 리턴
	+------+--------+
	| idx  | name   | <---- 현재 커서 위치
	+------+--------+
	|    1 | 홍길동 | <---- 처음 rs.next() 메서드 호출 시 커서 위치
	|    2 | 이순신 |
	|    3 | 강감찬 |
	|    4 | 김태희 |
	+------+--------+
	*/
	
	%>

	<table border="1">
		<tr>
			<th>idx</th><th>name</th>
		</tr>
	<%
	// rs.next() 메서드 리턴값이 true 일 동안 반복하면서 next() 메서드 호출
	while(rs.next()) { // 다음 레코드가 존재할 동안 반복
		// 커서가 위치한 레코드의 컬럼에 접근하여 데이터 가져오기
		// => ResultSet 객체의 getXXX() 메서드 호출(이 때, XXX 은 컬럼의 자바 데이터타입명)
		//    또한, getXXX() 메서드 파라미터로 컬럼인덱스 또는 컬럼명 전달 가능
		int idx = rs.getInt(1); // 첫번째(1번) 컬럼 데이터를 가져와서 idx 변수에 저장(INT 형)
		String name = rs.getString(2); // 두번째(2번) 컬럼 데이터를 가져와서 name 변수에 저장(VARCHAR 형)
		
// 		out.println("<h3>번호 : " + idx + ", 이름 : " + name + "</h3>");
		
// 		out.println("<tr>");
// 		out.println("<td>" + idx + "</td><td>" + name + "</td>");
// 		out.println("</tr>");
		%>
		<tr>
			<td><%=idx %></td><td><%=name %></td>
		</tr>
		<%
	} // while() 문 끝
	
	// 데이터베이스 작업 완료 후 반드시 사용 완료된 자원 반환해야한다! => close() 메서드 호출
	// 단, 자원을 생성한 순서의 역순으로 반환해야한다!
	// con -> pstmt -> rs 순으로 생성했으므로 rs -> pstmt -> con 순으로 반환
	rs.close();
	pstmt.close();
	con.close();
	%>
	
	</table>
</body>
</html>















