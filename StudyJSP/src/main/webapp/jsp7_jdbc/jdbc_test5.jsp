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
	<h1>jdbc_test5.jsp</h1>
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
	// test 테이블에 번호(idx)를 저장
	// => 저장될 번호는 외부로부터 전달받아 변수 idx 에 저장했다고 가정
// 	int idx = 99; // 외부로부터 전달받은 번호값
	
	// 3-1) SQL 구문 작성(전달할 idx 가 표시될 공간을 만능문자 파라미터(?) 로 미리 표시)
// 	String sql = "INSERT INTO test VALUES (?)";
	// 3-2) Connection 객체의 prepareStatement() 메서드를 통해 SQL 구문 전달 
    //      => PreparedStatement 객체 리턴
//     PreparedStatement pstmt = con.prepareStatement(sql);
    // 3-3) PreparedStatement 객체의 setXXX() 메서드를 호출하여 파라미터 데이터 교체(설정)
	//      => 전달할 데이터가 1개이며, 정수형 변수 idx 이므로 setInt() 메서드 호출
// 	pstmt.setInt(1, idx); // 첫번째 파라미터(?)에 정수형 변수 idx 값을 설정
    
	// test3 테이블에 번호와 이름을 추가
	int idx = 1; // 외부로부터 전달받은 번호값
	String name = "홍길동"; // 외부로부터
	String sql = "INSERT INTO test3 VALUES (?,?)";
	// => 주의! 두번째 파라미터는 이름(문자데이터)이므로 '' 기호로 둘러싸지만
	//    파라미터로 처리 시 그냥 파라미터(?)문자만 지정(setXXX() 메서드에서 문자 구분)
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.setString(2, name); // 문자데이터 구분
	
	// 4단계. SQL 구문 실행 및 결과 처리
	// PreparedStatement 객체의 executeXXX() 메서드를 호출하여 SQL 구문 실행
	// => INSERT 구문을 실행하기 위해 executeUpdate() 메서드 호출
	// => 실행 후 INSERT 된 레코드 수가 int 타입으로 리턴됨(DML 실행 결과만 카운팅 됨)
	int insertCount = pstmt.executeUpdate();
	out.println("<h3>" + insertCount + " 개 레코드 추가 성공!</h3>");
	%>
</body>
</html>


















