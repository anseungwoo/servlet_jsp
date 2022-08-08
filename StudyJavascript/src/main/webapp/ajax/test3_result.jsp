<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 전달받은 id 파라미터 가져와서 변수에 저장
String id = request.getParameter("id");
// out.println(id);

//DB 작업에 필요한 문자열 선언
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
// => member 테이블에서 id 가 일치하는 레코드 조회
String sql = "SELECT id FROM member WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	out.println("이미 사용중인 아이디");
} else {
	out.println("사용 가능한 아이디");
}
%>











