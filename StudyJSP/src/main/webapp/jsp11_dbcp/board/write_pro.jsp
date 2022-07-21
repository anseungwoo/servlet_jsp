
<%@page import="jsp11_dbcp.BoardDAO"%>
<%@page import="jsp11_dbcp.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
// 게시물 정보(폼파라미터) 가져와서 BoardDTO 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setName(request.getParameter("name"));
dto.setPasswd(request.getParameter("passwd"));
dto.setSubject(request.getParameter("subject"));
dto.setContent(request.getParameter("content"));
// out.println(dto.getName() + ", " + dto.getPasswd() + ", " + dto.getSubject() + ", " + dto.getContent());

// BoardDAO 객체의 insert() 메서드를 호출하여 게시물 등록 작업 수행
// => 파라미터 : BoardDTO 객체,  리턴타입 : int(insertCount)
// => 단, SQL 구문 작성 시 idx 값은 null, date 값은 now() 함수, readcount 값은 0 지정
BoardDAO dao = new BoardDAO();
int insertCount = dao.insert(dto);

// 글쓰기 작업 결과 판별
// => insertCount 가 0이면 자바스크립트 "글쓰기 실패!" 출력 후 이전페이지로 돌아가기
//    아니면, list.jsp 페이지로 포워딩
if(insertCount == 0) {
	%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
	<%
} else {
	response.sendRedirect("list.jsp");
}
%>










