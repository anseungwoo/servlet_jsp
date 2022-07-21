<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터로 전달받은 글번호(idx) 가져오기
int idx = Integer.parseInt(request.getParameter("idx"));

// 세션 아이디 가져와서 변수에 저장
String sId = (String)session.getAttribute("sId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	#modifyForm {
		width: 500px;
		height: 450px;
		border: 1px solid red;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
		width: 450px;
		margin: auto;
	}
	
	.td_left {
		width: 150px;
		text-align: center;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
</style>
</head>
<body>
	<%-- 세션아이디가 없을 경우(= 비회원) 자바스크립트로 "로그인 필수!" 출력 후 로그인페이지 이동 --%>
	<%if(sId == null) { %>
		<script>
			alert("로그인 필수!");
			location.href = "../member/login_form.jsp";
		</script>
	<%} %>
	
	<%
	// 수정에 필요한 게시물 상세 정보 조회를 위해 BoardDAO 객체의 selectDetail() 메서드 호출
	// => 새로운 메서드를 정의하는 것이 아닌 기존의 상세정보 조회 메서드 재사용
	// => 파라미터 : 글번호(idx), 리턴타입 : BoardDTO(dto)
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectDetail(idx);
	
	// 만약, BoardDTO 객체가 null 이면, 자바스크립트 "잘못된 요청" 출력 후 이전페이지로 돌아가기
	if(dto == null) { %>
		<script>
			alert("잘못된 요청!");
			history.back();
		</script>
	<%} %>
	
	<section id="modifyForm">
		<h1>글수정</h1>
		<form action="modify_pro.jsp" method="post">
			<!-- 수정에 필요한 글번호(idx)를 입력없이 POST 방식 전송하기 위해 input type="hidden" 필요 -->
			<input type="hidden" name="idx" value="<%=idx %>">
			<table>
				<!-- 각 입력항목에 조회된 내용 표시(작성자 수정 금지, 비밀번호 표시 불필요) -->
				<tr>
					<td class="td_left"><label for="name">작성자</label></td>
					<td class="td_right">
						<input type="text" name="name" value="<%=dto.getName() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="passwd">비밀번호</label></td>
					<td class="td_right"><input type="password" name="passwd" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="subject">제목</label></td>
					<td class="td_right">
						<input type="text" name="subject" value="<%=dto.getSubject() %>" required="required">
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="center">내용</label></td>
					<td class="td_right">
						<textarea rows="15" cols="40" name="content" required="required"><%=dto.getContent() %></textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="수정">
				<input type="reset" value="초기화">
				<input type="button" value="돌아가기" onclick="history.back()">			
			</section>
		</form>
	</section>
</body>
</html>










