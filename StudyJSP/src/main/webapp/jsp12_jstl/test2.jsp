<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
int num =20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test2.jsp</h1>
	<c:set var="name" value="Hello, World!"   />
	<c:set var="num" value="<%=num %>"   />
	<h3>\${name } : ${name }</h3>
	<h3>\${num } : ${num } </h3>
	<hr>
	<c:set var="targetTag" value="&lt;c:out&gt;"  />
	<h3>
	<c:out value="${ targetTag}"/>
	</h3>
	<h3>
	<c:out value="${ targetTag}" escapeXml="false"/>
	</h3>
	<hr>
	
	<c:remove var="name"  />
	<h3>
	<c:out value="${ name}"/>
	</h3>
	<h3>
	<c:out value="${empty name}" />
	</h3>
</body>
</html>