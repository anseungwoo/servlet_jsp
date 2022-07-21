<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// URL 파라미터로 전달받은 id 값 가져오기
String id = request.getParameter("id");
// out.println(id);

// 가져온 id 값에 해당하는 레코드 조회하여 각 입력창에 출력(비밀번호 제외하고 출력)
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
String sql = "SELECT * FROM test8_2 WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- id 중복확인 버튼 클릭 시 새 창 띄우기(check_id.html 파일 열기)  -->
	<h1>회원상세정보</h1>
	<form action="insertPro2.jsp" method="post" name="fr">
		<table border="1">
			<%
			while(rs.next()) {
				String name = rs.getString("name");
				String jumin = rs.getString("jumin"); // xxxxxx-yyyyyyy 형식
				// => 위의 주민번호를 앞 6자리, 뒤 7자리로 분리
				// => "-" 기호를 기준으로 split() 메서드를 통해 분리하면
				//    분리된 좌우 문자열이 String[] 타입으로 리턴됨
				String[] arrJumin = jumin.split("-");
				// => 0번 인덱스 : 주민번호 앞자리 6자리, 1번 인덱스 : 주민번호 뒷자리 7자리
				
				String email = rs.getString("email");
				// 이메일 주소를 @ 기호 기준으로 계정 & 도메인으로 분리
				String[] arrEmail = email.split("@");
				// => 0번 인덱스 : 계정명, 1번 인덱스 : 도메인
				
				String job = rs.getString("job");
				String gender = rs.getString("gender");
				String hobby = rs.getString("hobby");
				String content = rs.getString("content");
			%>
			<tr><td>이름</td><td><input type="text" name="name" value="<%=name%>"></td></tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력"
							 value="<%=id%>">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력">
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2">
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" value="<%=arrJumin[0]%>"> -
					<input type="text" name="jumin2" value="<%=arrJumin[1]%>">
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" value="<%=arrEmail[0]%>">@
					<input type="text" name="email2" value="<%=arrEmail[1]%>">
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job">
						<option value="">항목을 선택하세요</option>
						<%-- 자바 if문을 사용하여 selected 속성을 조건에 따라 실행되도록 하기 --%>
						<%-- equals() 메서드를 통해 문자열이 동일한지 판별 --%>
						<option value="개발자" <%if(job.equals("개발자")) {%> selected="selected"<%} %>>개발자</option>
						<option value="DB엔지니어" <%if(job.equals("DB엔지니어")) {%> selected="selected"<%} %>>DB엔지니어</option>
						<option value="관리자" <%if(job.equals("관리자")) {%> selected="selected"<%} %>>관리자</option>
						<option value="기타" <%if(job.equals("기타")) {%> selected="selected"<%} %>>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<%-- 자바 if문을 사용하여 checked 속성을 조건에 따라 실행되도록 하기 --%>
					<%-- equals() 메서드를 통해 문자열이 동일한지 판별 --%>
					<input type="radio" name="gender" value="남" <%if(gender.equals("남")) {%> checked="checked"<%} %>>남
					<input type="radio" name="gender" value="여" <%if(gender.equals("여")) {%> checked="checked"<%} %>>여
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<%-- 자바 if문을 사용하여 checked 속성을 조건에 따라 실행되도록 하기 --%>
					<%-- contains() 메서드를 통해 문자열이 포함되어 있는지 판별 --%>
					<input type="checkbox" name="hobby" value="여행" <%if(hobby.contains("여행")) {%> checked="checked"<%} %>>여행
					<input type="checkbox" name="hobby" value="독서" <%if(hobby.contains("독서")) {%> checked="checked"<%} %>>독서
					<input type="checkbox" name="hobby" value="게임" <%if(hobby.contains("게임")) {%> checked="checked"<%} %>>게임
				</td>
			</tr>
			<tr>
				<td>가입동기</td>
				<td><textarea name="content" cols="40" rows="10"><%=rs.getString("content")%></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</form>
</body>
</html>

















    