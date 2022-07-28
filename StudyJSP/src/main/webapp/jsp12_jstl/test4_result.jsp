<%@page import="jsp12_jstl.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test4_result.jsp</h1>
	<%-- 
	request 객체의 속성값을 가져올 때 request.getAttribute() 메서드 사용 대신
	EL 문법을 사용하여 속성명을 직접 지정하면 알아서 데이터 꺼내올 수 있다!
	=> page, request, session, application 영역을 차례대로 검사하며 일치하는 속성을 꺼내온다!
	--%>
	<h3>번호 : ${idx }</h3>
	<h3>이름 : ${name }</h3>
	<hr>
	
	<%-- 일반적인 for문을 사용하여 i값이 1 ~ 10 까지 1씩 증가하면서 반복 => i값 출력 --%>
	<%for(int i = 1; i <= 10; i++) { %>
		<%=i %>&nbsp;
	<%} %>
	<hr>
	<%-- JSTL 의 c:forEach 태그를 사용하여 for문과 동일한 작업 수행 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
		<%-- i 를 변수명으로 1부터 10까지 1씩 증가하는 forEach 문 --%>
		${i }&nbsp;
	</c:forEach>
	<hr>
	<%-- 자바의 객체에 접근하여 객체 내의 데이터를 차례대로 꺼내올 경우의 forEach 문 --%>
	<c:forEach var="item" items="${names }" varStatus="status">
		<%-- names 라는 이름의 객체(배열 포함)에서 값을 차례대로 꺼내서 item 이라는 변수에 저장 --%>
		<%-- varStatus 속성은 반복되는 객체의 인덱스 값이 자동으로 저장됨 --%>
		${status.index }번 배열 데이터 : ${item }&nbsp;
	</c:forEach>
	
	<hr>
	<%-- ArrayList 객체(memberList) 에 저장된 MemberDTO 객체를 차례대로 접근 --%>
	<%
	List<MemberDTO> memberList = (List)request.getAttribute("memberList");
	
	for(MemberDTO member : memberList) {
		out.println(member.getName());
	}
	%>
	<br>
	<c:forEach var="member" items="${memberList }">
		<%-- memberList 라는 속성(객체)에 접근하여 MemberDTO 타입 객체를 member 변수에 저장 --%>
		<%-- private 접근제한자가 적용된 멤버변수지만 변수명으로 접근 가능하므로 getter 호출 불필요 --%>
		${member.id }, ${member.passwd }, ${member.name }, ${member.age }<br>
	</c:forEach>
</body>
</html>










