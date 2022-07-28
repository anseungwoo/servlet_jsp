<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test3_result.jsp</h1>
	<%-- 자바에서 가장 많이 사용하는 문장에 대한 JSTL 문법(조건문, 반복문 등) --%>
	<%-- 변수 num2 를 선언 및 10 으로 초기화 --%>
	<c:set var="num2" value="10" />
	
	<%-- EL 사용하여 변수 num2 와 파라미터 num, name 값 출력 --%>
	<h3>파라미터 num = ${param.num }, 파라미터 name = ${param.name }</h3>
	<h3>변수 num2 = ${num2 }</h3>
	<hr>
	
	<%--
	[ 조건문 - if문 ]
	- c:if 태그 : if문에 해당하는 커스텀태그(단일 if문과 동일 - else 없음)
	- 주의! 조건식에 들어갈 문장도 EL 을 사용하여 표기
	<c:if test="조건식">
		// 조건식 판별 결과가 true 일 때 실행할 문장들...
	</c:if>
	--%>
	<c:if test="${param.num gt 0 }">
		<%-- if문 판별 결과가 true 일 때 실행할 태그를 기술하는 공간(끝 태그를 별도로 사용) --%>
		<h3>\${param.num } 이 0 보다 크다!</h3>
		<h3>그러므로 이 태그는 현재 페이지에서 출력된다!</h3>	
	</c:if>
	<hr>
	<%--
	<c:choose> <c:when> <c:otherwise> 태그
	- if ~ else 문 또는 if ~ else if ~ else 문 등에 해당하는 커스텀태그
	- <c:choose> 태그를 사용하여 조건식이라는 표시를 하고
	  <c:when> 태그에서 조건식을 지정 => 복수개를 사용 시 else if 문이 됨
	  <c:otherwise> 태그에서 조건식의 판별 결과가 false 일 때 수행할 문장 기술(= else 문과 동일)
	  
	<c:choose>
		<c:when test="조건식1">
			// 조건식1 이 true 일 때 실행할 문장들...
		</c:when>
		<c:when test="조건식n">
			// 조건식n 이 true 일 때 실행할 문장들...
		</c:when>
		<c:otherwise>
			// 조건식이 모두 false 일 때 실행할 문장들...(= else 문) => 생략 가능
		</c:otherwise>
	</c:choose>
	--%>
	<%-- 변수 num2 값에 대해 양수, 음수, 0 판별 --%>
	<c:set var="num2" value="0"/>
	<c:choose>
		<c:when test="${num2 gt 0 }"> <%-- 0 보다 클 경우(= 양수) --%>
			<h3>num2(${num2 }) : 양수!</h3>
		</c:when>
		<c:when test="${num2 lt 0 }"> <%-- 0 보다 작을 경우(= 음수) --%>
			<h3>num2(${num2 }) : 음수!</h3>
		</c:when>
		<c:otherwise> <%-- 위의 조건이 모두 false 일 경우(else 문이므로 조건식 불필요) --%>
			<h3>num2(${num2 }) : 양수도 아니고 음수도 아니다!</h3>
		</c:otherwise>
	</c:choose>
	<%-- 파라미터 name 값에 대해 "홍길동", "이순신", 그 외 나머지, 비어있을 경우 판별 --%>
	<h3>\${param.name } = ${param.name }</h3>
	<c:choose>
		<%-- 주의! 문자열 비교 시 작은따옴표('')로 표현 --%>
		<c:when test="${empty param.name }">
<!-- 			<h3>이름 입력 필수!</h3> -->
			<script type="text/javascript">
				alert("이름 입력 필수!");
				history.back();
			</script>
		</c:when>
		<c:when test="${param.name eq '홍길동' }">
			<h3>홍길동입니다!</h3>
		</c:when>
		<c:when test="${param.name eq '이순신' }">
			<h3>이순신입니다!</h3>
		</c:when>
		<c:otherwise>
			<h3>그 외 나머지!</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>













