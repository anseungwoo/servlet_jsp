<%@page import="jsp9_jdbc.TestDTO"%>
<%@page import="jsp9_jdbc.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

// TestDAO 클래스 인스턴스 생성
TestDAO dao = new TestDAO();
// selectInfo() 메서드를 호출하여
// idx 에 해당하는 레코드를 검색하고, 해당 결과를 TestDTO 객체에 저장한 후 리턴
// => 파라미터 : 번호(idx)    리턴타입 : TestDTO(dto)
TestDTO dto = dao.selectInfo(idx);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp - 회원 정보</h1>
	
	<%-- 조회 결과가 저장된 TestDTO 객체의 데이터를 HTML 태그를 사용하여 출력 --%>
	<h3>번호 : <%=dto.getIdx() %></h3>
	<h3>이름 : <%=dto.getName() %></h3>
</body>
</html>










