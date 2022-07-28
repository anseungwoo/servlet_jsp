
<%@page import="board.FileBoardDTO"%>
<%@page import="board.FileBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터로 전달받은 글번호(idx) 가져오기
int idx = Integer.parseInt(request.getParameter("idx"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

// 세션 아이디 가져와서 변수에 저장
String sId = (String)session.getAttribute("sId");
%>    
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_update.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%-- 세션아이디가 없을 경우(= 비회원) 자바스크립트로 "로그인 필수!" 출력 후 로그인페이지 이동 --%>
	<%if(sId == null) { %>
		<script>
			alert("로그인 필수!");
			location.href = "../member/login.jsp";
		</script>
	<%} %>
	
	<%
	// 수정에 필요한 게시물 상세 정보 조회를 위해 BoardDAO 객체의 selectDetail() 메서드 호출
	// => 새로운 메서드를 정의하는 것이 아닌 기존의 상세정보 조회 메서드 재사용
	// => 파라미터 : 글번호(idx), 리턴타입 : BoardDTO(dto)
	FileBoardDAO dao = new FileBoardDAO();
	FileBoardDTO dto = dao.selectFileBoard(idx);
	
	// 만약, BoardDTO 객체가 null 이면, 자바스크립트 "잘못된 요청" 출력 후 이전페이지로 돌아가기
	if(dto == null) { %>
		<script>
			alert("잘못된 요청!");
			history.back();
		</script>
	<%} %>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Notice</a></li>
				<li><a href="#">Public News</a></li>
				<li><a href="#">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Notice Update</h1>
			<form action="driver_updatePro.jsp" method="post">
			<input type="hidden" name="idx" value="<%=idx %>">
			<input type="hidden" name="pageNum" value="<%=pageNum %>">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" required="required" value="<%=dto.getName()%>"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="passwd" required="required"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject"  required="required" value="<%=dto.getSubject()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content" required="required"><%=dto.getContent() %> </textarea></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><%=dto.getRealFile() %></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="글수정" class="btn">
				</div>
			</form>
			<div class="clear"></div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>












