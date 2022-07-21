<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%
	// 폼 파라미터(아이디, 패스워드) 가져와서 변수에 저장
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro2.jsp</h1>

	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
	<!-- 
	로그인 작업(= 아이디, 패스워드 판별 작업) 수행
	ex) 아이디가 "admin" 이고, 패스워드가 "1234" 일 경우
	    자바스크립트를 사용하여 "로그인 성공!" 출력, 아니면 "로그인 실패!" 출력 
	---------------------------------------------------------------------------
	주의! 자바 코드 내에서 문자열 데이터를 비교할 때 동등비교연산자(==) 사용 시
	정상적인 비교가 불가능하므로 반드시 문자열 객체의 equals() 메서드를 호출해서
	문자열 비교를 수행해야한다!
	< 기본 문법 >
	if(문자열.equals(비교할문자열)) {}
	=> 문자열이 같은지 판별 후 boolean 타입 결과 리턴(true : 같음, false : 다름)
	-->
<%-- 	<%if(id == "admin" && passwd == "1234") { // 문자열의 정상적인 비교 불가 %> --%>
	<%if(id.equals("admin") && passwd.equals("1234")) { %>
<!-- 		<h3>로그인 성공!</h3> -->
		<script type="text/javascript">
			alert("로그인 성공!");
		</script>
	<%} else {%>
<!-- 		<h3>로그인 실패!</h3> -->
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
	<%} %>
</body>
</html>
















