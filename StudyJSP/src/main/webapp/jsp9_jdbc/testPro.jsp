<%@page import="jsp9_jdbc.TestDAO"%>
<%@page import="jsp9_jdbc.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int idx = Integer.parseInt(request.getParameter("idx")); 
String name = request.getParameter("name");

// 전달받은 폼 파라미터 데이터를 하나의 객체로 관리하기 위해
// TestDTO 클래스의 인스턴스를 생성한 후 Setter 메서드를 호출하여 데이터를 저장
TestDTO dto = new TestDTO();
dto.setIdx(idx);
dto.setName(name);

// 데이터베이스 작업을 수행하기 위한 TestDAO 클래스의 인스턴스 생성
TestDAO dao = new TestDAO();
// TestDAO 객체의 insert() 메서드를 호출하여 데이터 추가(INSERT) 작업 요청
// => 메서드 전달인자로 추가할 데이터가 저장되어 있는 TestDTO 객체를 전달
// => 리턴타입 : int(insertCount) 
// dao.insert(idx, name); // 데이터가 저장된 변수를 각각 별도로 전달할 경우(파라미터 2개 필요)
int insertCount = dao.insert(dto); // 데이터가 저장된 TestDTO 객체를 전달할 경우(파라미터 TestDTO 타입 1개 필요)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro.jsp</h1>
<%-- 	<h3>번호 : <%=idx %>, <%=dto.getIdx() %></h3> --%>
<%-- 	<h3>이름 : <%=name %>, <%=dto.getName() %></h3> --%>
	<!-- 작업 결과를 리턴받아 저장한 insertCount 변수값 판별(0 : 실패, 1 : 성공) -->
	<%if(insertCount > 0) { %>
		<h3>INSERT 작업 성공!</h3>
	<%} else { %>
		<h3>INSERT 작업 실패!</h3>
	<%} %>
	
	<button onclick="location.href='test2.jsp?idx=<%=idx%>'">test2.jsp 로 이동</button>
</body>
</html>





















