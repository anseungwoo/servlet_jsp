<%@page import="jsp10_board.BoardDAO"%>
<%@page import="jsp10_board.BoardReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String content = request.getParameter("replyContent");

// 전달받은 아이디와 댓글내용을 BoardReplyDTO 객체에 저장
BoardReplyDTO dto = new BoardReplyDTO();
dto.setId(id);
dto.setContent(content);

// BoardDAO 객체의 insertReply() 메서드를 호출하여 댓글 등록
// => 파라미터 : BoardReplyDTO 객체, 리턴타입 : int(insertCount)
BoardDAO dao = new BoardDAO();
int insertCount = dao.insertReply(dto);

// 댓글 작성 결과 판별
// => insertCount 가 0이면 자바스크립트를 사용하여 "댓글쓰기 실패!" 출력 후 이전페이지로 돌아가기
// => 아니면, detail.jsp 로 이동
if(insertCount == 0) {
	%>
	<script>
		alert("댓글쓰기 실패!");
		history.back();
	</script>
	<%
} else {
	// 댓글 등록 후 detail.jsp 페이지로 포워딩 => 파라미터로 idx(글번호) 값 전달
	response.sendRedirect("detail.jsp?idx=");
}
%>    













