<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내장 객체 중 영역 객체의 속성 및 범위(Scope)</h1>
	<%
	// 각 영역 객체에 값 저장 => setAttribute(String key, Object value) 메서드 사용
	pageContext.setAttribute("pageValue", "pageContext value");
	request.setAttribute("requestValue", "request value");
	session.setAttribute("sessionValue", "session value");
	application.setAttribute("applicationValue", "application value");
	%>
	
	<!-- 각 영역 객체에 저장된 값 가져오기 => getAttribute(String key) 메서드 사용 -->
	<h3>pageContext 객체 값 : <%=pageContext.getAttribute("pageValue") %></h3>
	<h3>request 객체 값 : <%=request.getAttribute("requestValue") %></h3>
	<h3>session 객체 값 : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application 객체 값 : <%=application.getAttribute("applicationValue") %></h3>
	
	<%
	// attributeScopeTest2.jsp 페이지로 포워딩
	// 1) page 객체(pageContext) 의 forward() 메서드를 호출하여 이동 : Dispatcher 방식 포워딩
	pageContext.forward("attributeScopeTest2.jsp"); 
	// => 기존 요청이 유지된 채로 페이지만 이동하므로 기존 request 객체(요청 정보)가 유지된다.
	//    따라서, request 객체에 저장되어 있던 속성에 여전히 접근이 가능함
	// => 주소표시줄의 주소가 이동하는 페이지 주소로 변경되지 않음(기존 주소가 유지됨)
	
	// 2) response 객체의 sendRedirect() 메서드를 호출하여 이동 : Redirect 방식 포워딩
// 	response.sendRedirect("attributeScopeTest2.jsp");
	// => 새로운 요청이 발생하므로 기존 request 객체(요청 정보)는 제거된다.
	//    따라서, request 객체에 저장되어 있던 속성도 제거되므로 null 값이 출력됨
	// => 주소표시줄의 주소가 이동하는 페이지의 주소로 변경됨
	%>
</body>
</html>

















