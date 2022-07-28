<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="org.apache.catalina.ant.jmx.JMXAccessorQueryTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();
boolean idCheck = dao.checkUser(id);


response.sendRedirect("check_id.jsp?id="+id+"&idCheck="+idCheck);


%>
