<%@page import="jsp10_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
// -------------------------------------------------------------------------------------
// BoardDAO 객체의 selectListCount() 메서드를 호출하여 전체 게시물 수 조회
// => 페이지 목록 계산에 필요
int listCount = dao.selectListCount();
// out.println("게시물 수 : " + listCount);

// 페이징 처리에 사용될 변수 선언
int pageNum = 1; // 현재 페이지 번호(기본값 1 페이지로 설정)
int listLimit = 10; // 한 페이지 당 표시할 게시물 수
int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 수

// 단, URL 파라미터로 현재 페이지번호(pageNum) 가 전달됐을 경우 가져와서 변수에 저장
if(request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum")); // String -> int 변환
}
// -------------------------------------------------------------------------------------
// 페이징 처리를 위한 계산 작업
// 1. 현재 페이지에서 표시할 전체 페이지 수 계산
// => 총 게시물 수 / 페이지 당 표시할 게시물 수
// => 주의! 총 게시물 수 / 페이지 당 표시할 게시물 수 연산 시 int / int = int 이므로
//    나머지 값을 실수로 계산되게 하려면 double 타입 연산 필요함
//    (즉, 최소 하나의 값을 double 타입으로 변환 후 나눗셈 연산 수행)
// => 계산 결과를 소수점 첫째자리에서 올림 처리를 위해 0.9 더하기
//    ex) 4.5 일 경우 1 페이지가 더 필요하므로 5.x 가 되어야 함(x.1 ~ x.9 까지 + 0.9)
// => 올림 처리된 값을 정수화를 통해 실수 제거
// int maxPage = (int)((double)listCount / listLimit + 0.9);
// java.lang.Math 클래스의 ceil() 메서드를 사용하여 올림 처리 가능
int maxPage = (int)Math.ceil((double)listCount / listLimit);

// 2. 현재 페이지에서 보여줄 시작 페이지 번호(1, 11, 21 등의 시작 번호) 계산
int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;

// 3. 현재 페이지에서 보여줄 끝 페이지 번호(10, 20, 30 등의 끝 번호) 계산
int endPage = startPage + pageLimit - 1;

// 4. 만약, 끝 페이지(endPage)가 현재 페이지에서 표시할 총 페이지 수(maxPage)보다 클 경우
//    끝 페이지 번호를 총 페이지 수로 대체
if(endPage > maxPage) {
	endPage = maxPage;
}
// -------------------------------------------------------------------------------------

// BoardDAO 객체의 selectList() 메서드를 호출하여 전체 게시물 목록 조회
// => 파라미터 : 없음, 리턴타입 : ArrayList(내부에 BoardDTO 객체가 들어있음)
// ArrayList list = dao.selectList();

// 페이징 처리 기능을 추가한 전체 게시물 목록 조회
// => 파라미터 : 현재 페이지 번호, 페이지 당 게시물 수
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
			if(list == null || list.size() == 0) {
				%>
				<tr>
					<td colspan="5">
						<h4>게시물이 없습니다.</h4>
					</td>
				</tr>
				<%
			} else {
				// ArrayList 객체 크기(저장된 요소 갯수)보다 작을 동안 반복
				for(int i = 0; i < list.size(); i++) {
					// ArrayList 객체에서 BoardDTO 객체를 차례대로 꺼내서 저장
					// => ArrayList 객체의 get() 메서드를 호출하여 인덱스(i) 번호 전달
					// => 단, get() 메서드 리턴타입이 Object 이므로 BoardDTO 타입으로 형변환 필수!
					BoardDTO dto = (BoardDTO)list.get(i);
					%>
					<tr>
						<%-- 각각의 td 태그에 BoardDTO 객체에서 꺼낸 데이터 출력 --%>
						<td><%=dto.getIdx() %></td> <!-- 번호 -->
						<%-- 제목에 하이퍼링크 설정(detail.jsp 로 이동 => 글번호(idx) 전달) --%>
						<td id="subject"> <!-- 제목 -->
							<a href="detail.jsp?idx=<%=dto.getIdx() %>"><%=dto.getSubject() %></a>
						</td> 
						<td><%=dto.getName() %></td> <!-- 작성자 -->
						<td><%=dto.getDate() %></td> <!-- 날짜 -->
						<td><%=dto.getReadcount() %></td> <!-- 조회수 -->
					</tr>
					<%	
				}
			}
			%>
		</table>
	</section>
	<section id="buttonArea">
		<input type="button" value="글쓰기" onclick="location.href='write_form.jsp'">
	</section>
	<section id="pageList">
		<!-- [이전] 버튼은 현재 페이지 번호(pageNum)가 1보다 클 경우에만 링크 동작 -->
		<!-- 클릭 시 list.jsp 페이지로 이동하면서 현재 페이지번호 - 1 값을 파라미터로 전달 -->
		<%if(pageNum > 1) { %>
			<input type="button" value="이전" onclick="location.href='list.jsp?pageNum=<%=pageNum - 1 %>'">
		<%} else { %>
			<input type="button" value="이전" disabled="disabled">
		<%} %>
		
		<!-- 페이지 목록은 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 -->
		<%for(int i = startPage; i <= endPage; i++) { %>
			<!-- 단, 현재 페이지 번호는 하이퍼링크 없이 표시(현재페이지번호와 i가 같을 경우) -->
			<%if(pageNum == i) { %>
				<%=i %>
			<%} else { %>
				<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
			<%} %>
		<%} %>
		<!-- 스크립틀릿과 out.println() 메서드를 조합할 경우 -->
		<%
// 		for(int i = startPage; i <= endPage; i++) {
// 			if(pageNum == i) {
// 				out.println(i);
// 			} else {
// 				out.println("<a href='list.jsp?pageNum=" + i + "'>" + i + "</a>");
// 			}
// 		}
		%>
		<!-- [다음] 버튼은 현재 페이지 번호(pageNum)가 끝 페이지번호(endPage)보다 작을 경우에만 링크 동작 -->
		<!-- 클릭 시 list.jsp 페이지로 이동하면서 현재 페이지번호 + 1 값을 파라미터로 전달 -->
		<%if(pageNum < endPage) { %>
			<input type="button" value="다음" onclick="location.href='list.jsp?pageNum=<%=pageNum + 1%>'">
		<%} else { %>
			<input type="button" value="다음" disabled="disabled">
		<%} %>
		
	</section>
</body>
</html>


















