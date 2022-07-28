<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jsp10_board.BoardReplyDTO"%>
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

// 현재 게시물의 댓글 목록 조회
// => 파라미터 : 글번호(idx), 리턴타입 : ArrayList(ArrayList 객체)
// => SQL 구문 : board_reply 테이블에서 ref 값이 전달받은 글번호(idx)와 동일한 레코드 조회
//    (SELECT id, content, date FROM board_reply WHERE ref=53) => 번호 역순으로 정렬(= 내림차순)
ArrayList replyList = dao.selectReplyList(idx);

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
	
	#replyArea {
		width: 600px;
		margin: auto;
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
	
	<section id="replyArea">
		<!-- insertForm 섹션(댓글 작성 영역)은 세션 아이디가 존재할 경우에만 출력 -->
		<%if(session.getAttribute("sId") != null) { %>
		<section id="insertForm">
			<form action="writeDetailReply_pro.jsp">
				<!-- 댓글 전송 시 세션 아이디도 함께 전송 -->
				<input type="hidden" name="id" value="<%=session.getAttribute("sId")%>">
				<!-- 댓글 전송 시 현재 게시물 글번호(idx)도 함께 전송 -->
				<input type="hidden" name="idx" value="<%=idx%>">
				<textarea rows="3" cols="50" name="replyContent"></textarea>
				<input type="submit" value="등록">
			</form>
		</section>
		<%} %>
		<section id="replyViewArea">
			<!-- ArrayList(replyList) 객체 크기만큼 for문 반복 -->
			<%
			for(int i = 0; i < replyList.size(); i++) {
				// ArrayList 객체에 저장되어 있는 BoardReplyDTO 객체를 꺼내서 저장
				BoardReplyDTO replyDto = (BoardReplyDTO)replyList.get(i);
				out.println(replyDto.getId() + " " + replyDto.getContent() + " " + replyDto.getDate() + "<br>");
			}
			%>
		</section>
	</section>
</body>
</html>




















