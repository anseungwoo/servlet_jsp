<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest2_result.jsp</h1>
	<%
	// 파라미터로 전달받은 id, passwd 값 가져와서 출력하기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
<%-- 	<h3>아이디 : <%=id %></h3> --%>
<%-- 	<h3>패스워드 : <%=passwd %></h3> --%>

	<!-- 
	만약, 입력받은 아이디가 "admin" 이고, 패스워드가 "1234" 일 경우
	자바스크립트를 통한 페이지 이동 처리
	-->
	<%if(id.equals("admin") && passwd.equals("1234")) {%>
		<!-- 자바스크립트를 사용하여 "로그인 성공!" 출력 후 responseTest2_result_success.jsp 로 이동 -->
		<script type="text/javascript">
// 			alert("로그인 성공!");
// 			location.href = "responseTest2_result_success.jsp";
		</script>
	<%} else {%>
		<!-- 자바스크립트를 사용하여 "로그인 실패!" 출력 후 이전페이지로 돌아가기 -->
		<script type="text/javascript">
// 			alert("로그인 실패!");
// 			history.back();
		</script>
	<%}%>
	
	<!-- 
	만약, 입력받은 아이디가 "admin" 이고, 패스워드가 "1234" 일 경우
	JSP 내장 객체인 response 객체를 통해 responseTest2_result_success.jsp 로 이동하고
	아니면, responseTest2_result_fail.jsp 로 이동하고
	-->
	<%
	if(id.equals("admin") && passwd.equals("1234")) {
		response.sendRedirect("responseTest2_result_success.jsp");
	} else {
		response.sendRedirect("responseTest2_result_fail.jsp");
	}
	%>
</body>
</html>
















