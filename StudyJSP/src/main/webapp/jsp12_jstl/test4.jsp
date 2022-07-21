<%@page import="jsp12_jstl.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setAttribute("idx", 3);
    request.setAttribute("name", "홍길동");
    
    request.setAttribute("intlist", 1);
    
    
    
   
    ArrayList<MemberDTO> memberList=new ArrayList<MemberDTO>();
    memberList.add(new MemberDTO("admin","관리자","1234",0));
    memberList.add(new MemberDTO("hong","홍길동","1234",1));
    memberList.add(new MemberDTO("kim","김길동","1234",2));
    String[] names={"홍길동","김길동","이길동"};
    request.setAttribute("memberList", memberList);
    request.setAttribute("names", names);
    pageContext.forward("test4_result.jsp");
    %>
