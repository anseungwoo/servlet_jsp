<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식 한글 인코딩 처리
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
String email = request.getParameter("email1") + "@" + request.getParameter("email2");
String job = request.getParameter("job");
String gender = request.getParameter("gender");
String[] hobbies = request.getParameterValues("hobby");
String hobby = "";
for(String item : hobbies) { // hobbies 배열 내의 각 항목을 차례대로 좌변의 item 변수에 저장 반복
	hobby += item + "/";
}
String content = request.getParameter("content");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro2.jsp</h1>
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
	
	// 3단계. SQL 작성 및 전달
	String sql = "INSERT INTO test8_2 VALUES (?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, passwd);
	pstmt.setString(4, jumin);
	pstmt.setString(5, email);
	pstmt.setString(6, job);
	pstmt.setString(7, gender);
	pstmt.setString(8, hobby);
	pstmt.setString(9, content);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	int insertCount = pstmt.executeUpdate();
	out.println("<h3>" + insertCount + " 개 레코드 추가 성공!</h3>");
	%>
</body>
</html>













