<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    request.setCharacterEncoding("UTF-8");
//     String name=request.getParameter("name");
//     String sessionV=(String)session.getAttribute("test");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL -test3_result.jsp</h1>


<c:set var="num2" value="10" />
<h3>${num2 }+ ${param.name }</h3>
<hr>
<c:if test="${ param.num%2 == 0 }" var="result1">
 <h3>\${ param.num} : ${ param.num} 짝수다</h3>
</c:if>
<hr>
<c:choose>
   <c:when test="${empty param.num}">
       <h3>\${ param.num} : ${ param.num}  값이 이상합니다</h3>
    </c:when>
    <c:when test="${ param.num%2 == 0 }">
      <h3>\${ param.num} : ${ param.num} 짝수다</h3>
    </c:when>
      <c:when test="${ param.num%2 == 1 }">
       <h3>\${ param.num} : ${ param.num} 홀수다</h3>
    </c:when>
       <c:when test="${ param.num lt 0 }">
       <h3>\${ param.num} : ${ param.num} 음수다</h3>
    </c:when>
    <c:otherwise>
       값이 이상합니다
    </c:otherwise>
</c:choose>

<c:choose>
   <c:when test="${empty param.name}">
<script type="text/javascript">
alert("이름 입력 필수");
history.back();
</script>
    </c:when>
    <c:when test="${ param.name == '홍길동' }">
      <h3>\${ param.name} : ${ param.name}님 입니다</h3>
    </c:when>
    <c:otherwise>
     <h3>\${ param.name} : ${ param.name} = 홍길동님이 아닙니다. </h3>
    </c:otherwise>
</c:choose>
</body>
</html>