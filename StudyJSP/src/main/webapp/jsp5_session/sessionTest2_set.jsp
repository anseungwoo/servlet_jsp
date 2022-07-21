<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp</h1>
	<%
	// session 객체에 속성값을 저장하는 방법
	// => session.setAttribute("속성명", 속성값);
	// => 첫번째 파라미터(속성명 = 키) : 저장할 데이터를 지정할 때 사용할 이름
	//                                   => 변수명과 동일한 역할을 수행
	// => 두번째 파라미터(속성값) : 세션 객체에 저장할 데이터(타입 무관) => 속성명으로 접근 가능
	session.setAttribute("sessionValue1", "첫번째 세션값");
	session.setAttribute("sessionValue2", "두번째 세션값");
	%>
	
	<h1>세션값 생성 완료!</h1>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>
	<!-- 
	임시. session 객체로부터 저장된 데이터를 꺼내기
	=> session.getAttribute("속성명")
	=> 파라미터 : 저장된 값을 가리키는 이름(속성명 = 키)
	=> 지정된 속성명에 해당하는 데이터(값)를 리턴(Object 타입)
	-->
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue2") %></h3>
</body>
</html>

















