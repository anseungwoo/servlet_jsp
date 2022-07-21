<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 아이디 가져와서 변수에 저장
String sId = (String)session.getAttribute("sId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	#writeForm {
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
	
	<section id="writeForm">
		<h1>글쓰기</h1>
		<form action="write_pro.jsp" method="post">
			<table>
				<tr>
					<td class="td_left"><label for="name">작성자</label></td>
					<td class="td_right"><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="passwd">비밀번호</label></td>
					<td class="td_right"><input type="password" name="passwd" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="subject">제목</label></td>
					<td class="td_right"><input type="text" name="subject" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="center">내용</label></td>
					<td class="td_right">
						<textarea rows="15" cols="40" name="content" required="required"></textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">
				<input type="reset" value="다시쓰기">
				<input type="button" value="돌아가기" onclick="history.back()">			
			</section>
		</form>
	</section>
</body>
</html>










