<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx")); // String -> int 변환


BoardDAO dao = new BoardDAO();
// BoardDAO 객체의 selectDetail() 메서드를 호출하여 글 상세정보 조회
// 단, 상세 정보 조회 전 조회수 증가 작업 수행을 위해 updateReadcount() 메서드를 먼저 호출
// =>  파라미터 : 글번호(idx), 리턴타입 : void
dao.updateReadcount(idx);
// 글 상세 정보 조회
// => 파라미터 : 글번호(idx), 리턴타입 : BoardDTO(dto)
BoardDTO dto = dao.selectDetail(idx);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	#articleForm {
		width: 600px;
		height: 550px;
		border: 1px solid red;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
	 	width: 600px;
	}
	
	tr {
		height: 35px;
	}
	
	th {
		background: skyblue;
	}
	
	td {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 55px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
		white-space: pre-line;
	}
	
	#commandCell {
		margin: 10px auto;
		width: 500px;
		text-align: center;
	}
</style>
</head>
<body>
	<section id="articleForm">
		<h1>글 상세내용</h1>
		<section id="basicInfoArea">
			<table>
				<tr>
					<th>제목</th><td colspan="6"><%=dto.getSubject() %></td>
				</tr>
				<tr>
					<th width="70">작성자</th><td><%=dto.getName() %></td>
					<th width="70">작성일</th><td width="90"><%=dto.getDate() %></td>
					<th width="70">조회수</th><td width="70"><%=dto.getReadcount() %></td>
				</tr>
			</table>
		</section>
		<section id="articleContentArea">
			<%=dto.getContent() %>
		</section>
		<section id="commandCell">
			<!-- 수정 링크 클릭 시 modify.jsp 페이지로 이동(수정에 필요한 게시물 조회를 위해 idx 전달) -->
			<input type="button" value="수정" onclick="location.href='modify.jsp?idx=<%=idx%>'">
			<input type="button" value="삭제" onclick="location.href='delete.jsp?idx=<%=idx%>'">
			<input type="button" value="목록" onclick="location.href='list.jsp'">			
		</section>
	</section>
</body>
</html>




















