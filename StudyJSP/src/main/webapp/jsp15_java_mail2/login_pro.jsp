<%@page import="jsp10_board.MemberDAO"%>
<%@page import="jsp10_board.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// id, passwd 파라미터 가져와서 저장 및 확인
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
// out.println("아이디 : " + id + ", 패스워드 : " + passwd);

// MemberDTO 객체에 id, passwd 저장
MemberDTO dto = new MemberDTO();
dto.setId(id); // dto.setId(request.getParameter("id")) 와 동일
dto.setPasswd(passwd); // dto.setId(request.getParameter("passwd")) 와 동일

// MemberDAO 객체의 checkUser() 메서드를 호출하여 로그인 작업 수행
// => 파라미터 : MemberDTO 객체, 리턴타입 : boolean(isLoginSuccess)
MemberDAO dao = new MemberDAO();
boolean isLoginSuccess = dao.checkUser(dto);

// 로그인 작업 수행 결과 판별
// => isLoginSuccess 가 false 일 경우 자바스크립트 "로그인 실패!" 출력 후 이전페이지로 돌아가기
// => 아니면, 메인페이지로 이동
if(!isLoginSuccess) { // 로그인 실패(isLoginSuccess == false 와 동일)
	%>
	<script>
		alert("로그인 실패!");
		history.back();
	</script>
	<%
} else { // 로그인 성공(isLoginSuccess == true 와 동일)
	// 세션 객체(HttpSession session)에 로그인에 성공한 아이디를 "sId" 라는 속성명으로 저장
	// => HttpSession 객체의 setAttribute() 메서드 사용
	session.setAttribute("sId", dto.getId());
	// 메인페이지로 이동
	response.sendRedirect("../main.jsp");
}

%>    














