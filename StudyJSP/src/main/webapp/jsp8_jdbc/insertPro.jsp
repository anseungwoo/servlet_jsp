<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식일 때 request 객체에 대한 한글 인코딩 처리
request.setCharacterEncoding("UTF-8");

// insertForm.jsp 페이지로부터 전달받은 폼파라미터(이름, 나이, 성별, 취미) 변수에 저장 및 출력
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age")); // String -> int 로 변환 필수!
String gender = request.getParameter("gender");
String hobby = ""; // 취미는 모두 문자열 결합(/ 또는 공백으로 구분)
// hobby 는 복수개의 동일한 name 속성이 값만 다른 채로 전달되므로
// getParameter() 대신 getParameterValue() 메서드를 호출하여 배열로 리턴받아야 함
String[] hobbies = request.getParameterValues("hobby");
// for(int i = 0; i < hobbies.length; i++) {
// 	hobby += hobbies[i] + "/";
// }

// 향상된 for문을 사용하여 배열에 접근하는 방법
// => for(데이터를 저장할 변수 선언 : 데이터가 저장되어 있는 배열 또는 컬렉션객체) {}
for(String item : hobbies) { // hobbies 배열 내의 각 항목을 차례대로 좌변의 item 변수에 저장 반복
	hobby += item + "/";
}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>취미 : <%=hobby %></h3>
	
	<%
	/*
	----------------------------------------------------------------------------
	< 테이블 생성 > 
	CREATE TABLE test8_1 (
		name VARCHAR(10) UNIQUE,
		age INT,
		gender CHAR(1),
		hobby VARCHAR(10)
	);
	------------------------------
	< 데이터베이스 작업 수행 >
	test8_1 테이블에 입력 데이터를 모두 추가
	----------------------------------------------------------------------------
	*/
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
	String sql = "INSERT INTO test8_1 VALUES (?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, age);
	pstmt.setString(3, gender);
	pstmt.setString(4, hobby);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int insertCount = pstmt.executeUpdate();
	out.println("<h3>" + insertCount + " 개 레코드 추가 성공!</h3>");
	%>
	
</body>
</html>










