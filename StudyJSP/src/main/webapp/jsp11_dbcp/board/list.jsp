<%@page import="jsp10_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();

int listCount = dao.selectListCount();

int pageNum = 1;//현재페이지번호
int listLimit = 10;//한페이지당 표시할 게시물 수
int pageLimit = 10;// 한페이지당 표시할 페이지 목록 수
if (request.getParameter("pageNum") != null && request.getParameter("pageNum") != "") {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
 
// int maxPage= (int)((double)listCount/listLimit+0.9);
int maxPage = (int) Math.ceil((double) listCount / listLimit);
int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
int endPage = startPage + pageLimit - 1;
if (endPage > maxPage) {
	endPage = maxPage;
}
out.println("총 페이지 수 : " + maxPage);
out.println("시작 페이지 번호 : " + startPage);
out.println("끝 페이지 수 : " + endPage);

// BoardDAO 객체의 selectList() 메서드를 호출하여 전체 게시물 목록 조회
// => 파라미터 : 없음, 리턴타입 : ArrayList(내부에 BoardDTO 객체가 들어있음)
// ArrayList list = dao.selectList();

ArrayList list = dao.selectList(pageNum, listLimit);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#listForm {
	width: 1024px;
	max-height: 600px;
	margin: auto;
}

h1 {
	text-align: center;
}

table {
	width: 1024px;
	margin: auto;
}

#tr_top {
	text-align: center;
	background: orange;
}

table td {
	text-align: center;
}

#subject {
	text-align: center;
	padding-left: 20px;
}

#buttonArea {
	width: 1024px;
	text-align: right;
	margin: auto;
}

#pageList {
	width: 1024px;
	text-align: center;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<section id="listForm">
		<h1>글목록</h1>
		<table>
			<tr id="tr_top">
				<td width="100px">번호</td>
				<td>제목</td>
				<td width="150px">작성자</td>
				<td width="150px">날짜</td>
				<td width="100px">조회수</td>
			</tr>
			<%-- 조회 결과로 리턴받은 ArrayList 객체로부터 글목록 가져와서 출력 --%>
			<%-- 단, 게시물이 하나도 없을 경우 "게시물이 없습니다" 출력 --%>
			<%
			if (list == null || list.size() == 0) {
			%>
			<tr>
				<td colspan="5">
					<h4>게시물이 없습니다.</h4>
				</td>
			</tr>
			<%
			} else {
			// ArrayList 객체 크기(저장된 요소 갯수)보다 작을 동안 반복
			for (int i = 0; i < list.size(); i++) {
				// ArrayList 객체에서 BoardDTO 객체를 차례대로 꺼내서 저장
				// => ArrayList 객체의 get() 메서드를 호출하여 인덱스(i) 번호 전달
				// => 단, get() 메서드 리턴타입이 Object 이므로 BoardDTO 타입으로 형변환 필수!
				BoardDTO dto = (BoardDTO) list.get(i);
			%>
			<tr>
				<%-- 각각의 td 태그에 BoardDTO 객체에서 꺼낸 데이터 출력 --%>
				<td><%=dto.getIdx()%></td>
				<!-- 번호 -->
				<%-- 제목에 하이퍼링크 설정(detail.jsp 로 이동 => 글번호(idx) 전달) --%>
				<td id="subject">
					<!-- 제목 --> <a href="detail.jsp?idx=<%=dto.getIdx()%>"><%=dto.getSubject()%></a>
				</td>
				<td><%=dto.getName()%></td>
				<!-- 작성자 -->
				<td><%=dto.getDate()%></td>
				<!-- 날짜 -->
				<td><%=dto.getReadcount()%></td>
				<!-- 조회수 -->
			</tr>
			<%
			}
			}
			%>
		</table>
	</section>
	<section id="buttonArea">
		<input type="button" value="글쓰기"
			onclick="location.href='write_form.jsp'">
	</section>
	<section id="pageList">
		<%
		if (pageNum > 1) {
		%>
		<input type="button" value="이전"
			onclick="location.href='list.jsp?pageNum=<%=pageNum - 1%>'">
		<%
		}else{
		%>
		<input type="button" value="이전" disabled="disabled">
		<%
		}
		%>
		<%
		for (int i = startPage; i <= endPage; i++) {
		%>
		<%
		if (pageNum == i) {
		%>
		<%=i%>
		<%
		} else {
		%>

		<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>
		<%
		}
		}
		%>

		<%
		// 		for (int i = startPage; i <= endPage; i++) {
		// 			if (pageNum == i) {
		// 				out.println(i);
		// 			} else {
		// 				out.println("<a href='list.jsp?pageNum=" + i + "'>" + i + "</a>");
		// 			}
		// 		}
		%>


		<%
		if (pageNum < endPage) {
		%>
		<input type="button" value="다음"
			onclick="location.href='list.jsp?pageNum=<%=pageNum + 1%>'">
		<%
		}else{
		%>
		<input type="button" value="다음" disabled="disabled">
		<%
		}
		%>
	</section>
</body>
</html>










