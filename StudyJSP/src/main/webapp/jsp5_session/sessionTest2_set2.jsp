<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set2.jsp</h1>
	<%
	// product_id 파라미터 가져와서 출력
	String product_id = request.getParameter("product_id");
// 	out.println(product_id);

	// 세션 객체에 "cart_item" 이라는 속성명으로 제품번호(product_id)를 저장
	session.setAttribute("cart_item", product_id);
	
	// sessionTest2_get2.jsp 페이지로 포워딩
	response.sendRedirect("sessionTest2_get2.jsp");
	%>
</body>
</html>













