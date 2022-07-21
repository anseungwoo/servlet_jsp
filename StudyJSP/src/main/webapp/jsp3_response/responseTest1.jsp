<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>responseTest1.jsp</h1>
	<!-- 
	response 객체
	- 클라이언트의 HTTP 요청(request)에 대한 HTTP 응답(response) 정보를 관리하는 객체
	- 서버에서 클라이언트에 대한 여러 응답 데이터 관리 및 변경 가능
	- response.XXX() 메서드를 호출하여 값 변경
	1) 클라이언트의 응답 데이터 헤더값 변경
       response.setHeader("헤더이름", "변경할 헤더값");
	2) 클라이언트의 응답 데이터 컨텐츠 타입 변경
	   response.setContentType("text/html; charset=UTF-8")
	3) 클라이언트의 쿠키값 생성 및 관리
       response.addCookie(쿠키정보);
	4) 클라이언트 요청에 대한 응답 페이지 설정(페이지 이동 = 포워딩 처리)
	   response.sendRedirect("이동할 페이지 URL 또는 파일명");
	   => location.href = "이동할 페이지 URL 또는 파일명" 기능과 동일한 역할 수행
	   => 하이퍼링크(a 태그) 를 사용하여 이동하는 방식과도 동일함(반드시 링크 클릭 필요)
	      ex) <a href="a.jsp">클릭</a>
	-->
	<hr>
	<h3>하이퍼링크</h3>
	<!-- 페이지 이동(포워딩) 처리 -->
	<!-- 1. 하이퍼링크를 통해 이동할 경우 -->
	<a href="responseTest1_result.jsp">responseTest1_result.jsp 로 이동</a><br>
	<a href="http://www.naver.com">네이버로 이동</a>
	
	<hr>
	<h3>자바스크립트</h3>
	<!-- 2. 자바스크립트를 통해 이동할 경우 -->
	<!-- 자바스크립트 코드가 로딩(실행)되면 즉시 해당 페이지로 이동 -->
	<script type="text/javascript">
		// 위의 다른 태그들에 의한 텍스트는 보이지 않고, 바로 응답페이지로 이동하여 결과 표시됨
// 		location.href = "responseTest1_result.jsp";
	</script>
	
	<hr>
	<h3>자바 코드</h3>
	<!-- 3. 자바의 response 객체의 sendRedirect() 메서드를 호출하여 이동할 경우 -->
	<%
	// 내장 객체인 response 객체의 sendRedirect() 메서드 호출
	// => 파라미터로 이동할 페이지 URL 또는 파일명 전달
	// => 자바스크립트의 location.href 와 마찬가지로 이동 후의 응답페이지만 표시됨
	response.sendRedirect("responseTest1_result.jsp");
	%>
</body>
</html>














