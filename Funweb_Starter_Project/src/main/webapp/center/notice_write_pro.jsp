<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
BoardDTO dto = new BoardDTO();
dto.setName(request.getParameter("name"));
dto.setPasswd(request.getParameter("pass"));
dto.setSubject(request.getParameter("subject"));
dto.setContent(request.getParameter("content"));
BoardDAO dao = new BoardDAO();
int insertCount = dao.insert(dto);


%>
<% 
if(insertCount == 0) {
	%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
	<%
} else {
	response.sendRedirect("notice.jsp");
}
%>