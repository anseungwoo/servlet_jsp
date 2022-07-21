<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 스크립틀릿(= 자바의 메서드 내부와 동일)
int hour = 10;
int min = 59;
int sec = 20;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp - 스클립틀릿과 표현식 연습</h1>
	
	<%-- 스크립틀릿 내에서 선언된 변수는 표현식을 사용하여 출력 가능 --%>
	<h3>현재 시각 : <%=hour %>시 <%=min %>분 <%=sec %>초</h3>
	
	<%--
	스크립틀릿 내에서는 자바의 일반적인 문법이 모두 사용 가능하므로 if문 등도 사용 가능
	=> 따라서, HTML 태그를 특정 조건에서만 실행되도록 하려면
	   if문 블록과 HTML 태그를 조합하여 실행 여부 결정 가능
	=> 단, 자바 코드 블록과 HTML 태그를 조합하기 위해서는 다음 두 가지 방법 중 한 가지 택
	1) 스크립틀릿으로 자바 코드를 사용하고, HTML 태그는 블록문 내에서 out.println() 메서드 사용
	   => HTML 태그보다 자바 코드가 더 많을 때 주로 사용
	2) 스크립틀릿으로 자바 코드만 사용하고 블럭 사이의 스크립틀릿 외부에 HTML 태그 작성
	   => 자바 코드보다 HTML 코드가 더 많을 때 주로 사용
	--%>
	<%
	// 1번) 스크립틀릿 내에서 out.println() 메서드를 사용하여 태그를 문자열로 지정하는 방법
	// if 문을 사용하여 현재 시각(hour)이 12 미만이면 "오전입니다" 출력하고, 
	// 아니면 "오후입니다" 출력
	if(hour < 12) {
		// 이 위치는 스크립틀릿 내부이므로 자바코드만 인식 가능(태그 출력은 out.println() 사용)
		out.println("<h3>오전입니다.</h3>");
	} else {
		out.println("<h3>오후입니다.</h3>");
	}
	%>
	
	<%-- 2번) 스크립틀릿으로 if 문 블럭만 표현하고, HTML 태그는 스크립틀릿 외부에서 표현 --%>
	<%if(hour < 12) { %>
		<!-- 이 위치는 스크립틀릿 외부이므로 HTML 태그를 인식 가능(태그 출력은 HTML 그대로 사용) -->
		<h3>오전입니다.</h3>
	<%} else { %>
		<h3>오후입니다.</h3>
	<%} %>
</body>
</html>














