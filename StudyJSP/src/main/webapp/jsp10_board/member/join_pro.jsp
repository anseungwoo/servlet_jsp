<%@page import="jsp10_board.MemberDAO"%>
<%@page import="jsp10_board.MemberDTO"%>
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
String content = request.getParameter("content");

// 전달받은 파라미터 데이터(1명의 회원정보)를 MemberDTO 객체에 저장
MemberDTO dto = new MemberDTO();
dto.setName(name);
dto.setId(id);
dto.setPasswd(passwd);
dto.setJumin(jumin);
dto.setEmail(email);
dto.setJob(job);
dto.setGender(gender);
dto.setContent(content);

// MemberDAO 객체의 insertMember() 메서드를 호출하여 회원 추가 작업 수행
// => 파라미터 : MemberDTO, 리턴타입 : int(insertCount)
MemberDAO dao = new MemberDAO();
int insertCount = dao.insertMember(dto);

// 작업 완료 후 insertCount 변수 리턴값 판별
// => 0일 경우 자바스크립트를 통해 "회원 추가 실패!" 출력 후 이전페이지로 돌아가기
// => 아니면, 메인페이지로 포워딩(response 객체의 sendRedirect() 메서드 사용)
if(insertCount == 0) {
	%>
	<script>
		alert("회원 추가 실패!");
		history.back();
	</script>
	<%
} else {
	response.sendRedirect("../main.jsp"); // 현재 경로의 상위 디렉토리에 있는 main.jsp 로 이동
}
%>    














