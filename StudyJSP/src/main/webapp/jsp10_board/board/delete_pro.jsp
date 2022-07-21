<%@page import="jsp10_board.BoardDAO"%>
<%@page import="jsp10_board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("passwd");
// out.println(idx + ", " + passwd); 

// BoardDTO 객체에 폼파라미터 데이터 저장
BoardDTO dto = new BoardDTO();
dto.setIdx(idx);
dto.setPasswd(passwd);

// BoardDAO 객체의 delete() 메서드 호출하여 게시물 삭제 작업 요청
// => 패스워드가 틀렸을 경우 등 실패 여부를 판단하기 위해 int 타입 값 리턴받기
// => 파라미터 : BoardDTO 객체   리턴타입 : int(deleteCount)
BoardDAO dao = new BoardDAO();
int deleteCount = dao.delete(dto);

// 삭제 작업 결과 판별
// => 만약, deleteCount 가 0일 경우 실패이므로
//    자바스크립트 통해 "패스워드 틀림!" 출력 후 이전페이지로 돌아가기
// => 아니면, 성공이므로 list.jsp 페이지로 포워딩
if(deleteCount == 0) {
	%>
	<script>
		alert("패스워드 틀림!");
		history.back();
	</script>
	<%
} else {
	response.sendRedirect("list.jsp");
}
%>











