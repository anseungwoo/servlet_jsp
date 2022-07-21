<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 초기화
session.invalidate();

// sessionTest3_main.jsp 페이지 포워딩
response.sendRedirect("sessionTest3_main.jsp");
%>