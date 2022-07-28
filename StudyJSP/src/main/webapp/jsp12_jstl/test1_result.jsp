<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL - test1_result.jsp</h1>
	<%-- 기존 자바코드를 활용한 파라미터 및 속성값 처리 방법 --%>
	<%
	String name = request.getParameter("name");
	String sId = (String)session.getAttribute("testValue");
	%>
	<h3>이름 : <%=name %></h3>
	<h3>세션값 : <%=sId %></h3>
	<hr>
	<h3>이름 : <%=request.getParameter("name") %></h3>
	<h3>세션값 : <%=session.getAttribute("testValue") %></h3>
	<hr>
	<%-- ==================================================== --%>
	<%--
	EL(Expression Language)
	- JSP 스크립트 태그(= 표현식 <%=%>) 대신 사용 가능한 데이터 처리 표현 방식(= 언어)
	- JSP 스크립트 태그는 다른 일반 태그와 혼동을 가져올 수 있으나,
	  EL 은 이러한 단점을 보완
	- ${데이터} 형식으로 표현
	  ex) test 라는 변수값을 EL 로 표현할 경우 ${test}
	- 변수 값만 지정 가능한 것이 아니라 내장 객체 및 연산자도 제공됨
	  1) 이전 페이지로부터 전달받은 request 객체의 파라미터 접근 시 : ${param.파라미터명}
	  2) 세션 객체의 속성 접근 시 : ${sessionScope.속성명} 
	- EL 문장을 데이터로서 취급해야할 경우(= 파싱되지 않고 문자 자체로 사용할 경우)
	  $ 기호 앞에 \ 기호를 붙여서 표현 시 해당 문장은 EL 이 아닌 단순 텍스트로 취급됨
	  ex) ${name} 을 텍스트로 취급 시 \${name} 으로 표현하면 변수가 아닌 단순 텍스트 ${name} 이 됨
	- DTO 객체에 접근하여 멤버변수의 값을 사용할 때 ${객체명.변수명} 형태로 접근이 가능하며
	  변수에 직접 접근하는 것처럼 보이지만 실제로는 getXXX() 메서드를 호출하는것이 된다!
	  따라서, 멤버변수 접근자를 private 으로 지정하고 Getter 메서드를 정의해야 사용 가능하다!
	--%>
	<%-- EL 을 사용하여 request 객체의 파라미터 처리(내장 객체 param 활용 => ${param.파라미터명}) --%>
	<h3>이름 : ${param.name}</h3>
	<h3>\${param.name} : ${param.name}</h3>
	<%-- EL 을 사용하여 session 객체의 속성 처리 --%>
	<h3>세션값 : ${sessionScope.testValue }</h3>
	<h3>\${sessionScope.testValue } : ${sessionScope.testValue }</h3>
	<hr>
	<%-- EL 의 연산자 사용 --%>
	<h3>\${10 + 20 } = ${10 + 20 }</h3>
	<%-- 파라미터 값을 연산자에 활용도 가능하며 숫자 데이터의 경우 별도의 형변환도 불필요(자동) --%>
	<h3>\${param.num + 20 } = ${param.num + 20 }</h3>
	<h3>\${10 >= 20 } = ${10 >= 20 }</h3>
	<h3>\${10 ge 20 } = ${10 ge 20 }</h3>
	<%-- empty 연산자를 사용하여 비교 시 null 값이거나 값이 비어있거나 컬렉션 사이즈가 0일 경우 true 리턴됨 --%>
	<h3>\${empty param.name} = ${empty param.name}</h3>
	<h3>\${not empty param.name} = ${not empty param.name}</h3>
	<%-- 주의! eq null 연산자를 사용하여 비교 시 진짜 null 값일 경우에만 true 리턴됨 --%>
	<%-- 지정한 파라미터 등이 존재하지 않을 경우(값이 없는 것이 아닌 파라미터가 없는 것) true --%>
	<h3>\${param.age eq null} = ${param.age eq null}</h3>
</body>
</html>










