<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

// out.println("아이디 : " + id + ", 패스워드 : " + passwd);

// 데이터베이스에 저장된 아이디와 패스워드 비교 작업을 수행하기 위해
// 임시로 조회된 아이디, 패스워드라고 가정하는 변수 생성
String dbId = "admin";
String dbPasswd = "1234";

// 입력받은 아이디(id)와 데이터베이스의 아이디(dbId) 가 일치하는지 판별
// => 1) 아이디가 일치할 경우
//		 => 1-1) 패스워드가 일치할 경우
//               => 세션에 "sId" 라는 속성명으로 로그인 요청한 아이디를 저장 후
//                  sessionTest3_main.jsp 페이지로 포워딩
//       => 1-2) 패스워드가 일치하지 않을 경우
//               => "패스워드 틀림" 출력 후 이전페이지로 돌아가기
// => 2) 아이디가 일치하지 않을 경우
//       => "존재하지 않는 아이디" 출력 후 이전페이지로 돌아가기
if(id.equals(dbId)) { // 아이디 일치
	if(passwd.equals(dbPasswd)) { // 패스워드 일치
		// 로그인 성공한 아이디를 세션 객체에 저장 후 이동
		session.setAttribute("sId", id);
		response.sendRedirect("sessionTest3_main.jsp");
	} else { // 패스워드 불일치
		%>
		<script>
			alert("패스워드 틀림");
			history.back();
		</script>
		<%
	}
} else { // 아이디 불일치
	%>
	<script>
		alert("존재하지 않는 아이디");
		history.back();
	</script>
	<%
}
%>















