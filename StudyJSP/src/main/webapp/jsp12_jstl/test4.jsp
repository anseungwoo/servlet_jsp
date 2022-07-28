<%@page import="jsp12_jstl.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에 데이터 저장 후 test4_result.jsp 페이지로 포워딩
request.setAttribute("idx", 3);
request.setAttribute("name", "홍길동");

// ArrayList 객체 생성 및 MemberDTO 객체 추가(저장) => request 객체에 저장
List memberList = new ArrayList();
memberList.add(new MemberDTO("admin", "1234", "관리자", 0));
memberList.add(new MemberDTO("hong", "1234", "홍길동", 20));
memberList.add(new MemberDTO("leess", "1234", "이순신", 44));
request.setAttribute("memberList", memberList);

// String 타입 배열 생성 및 이름 저장 => request 객체에 저장
String[] names = {"홍길동", "이순신", "강감찬"};
request.setAttribute("names", names);

// request 객체를 유지하면서 포워딩을 하기 위해 response.sendRedirect() 메서드가 아닌
// pageContext.forward() 메서드로 포워딩 = Dispatcher 방식의 포워딩
pageContext.forward("test4_result.jsp");
%>











