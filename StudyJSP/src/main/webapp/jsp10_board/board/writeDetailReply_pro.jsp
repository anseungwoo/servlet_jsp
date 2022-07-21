<%@page import="jsp10_board.BoardDAO"%>
<%@page import="jsp10_board.BoardReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String replyContent = request.getParameter("replyContent");
    String id =request.getParameter("id");
    int idx =Integer.parseInt(request.getParameter("idx"));
    
    BoardReplyDTO dto =new BoardReplyDTO();
    dto.setId(id);
    dto.setContent(replyContent);
    dto.setRef(idx);
    BoardDAO dao =new BoardDAO();
    int insertCount=dao.insertReply(dto);
    
    if(insertCount == 0) {
		%>
		<script>
			alert(" 댓글 쓰기 실패!");
			history.back();
		</script>
		<%
	} else {
		response.sendRedirect("detail.jsp?idx="+idx);
	}
    
    %>
