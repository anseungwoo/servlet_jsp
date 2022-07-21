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
<title>Insert title here</title>
<style type="text/css">
	#deleteForm {
		width: 300px;
		margin: auto;
		border: 1px solid orange;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
		width: 300px;
		margin: auto;
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
	<h1>글 삭제</h1>
	<section id="deleteForm">
		<form action="delete_pro.jsp" method="post">
			<!-- 히든 타입으로 글번호(idx)도 함께 전송 -->
			<input type="hidden" name="idx" value="<%=idx %>">
			<table>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="passwd" required="required">
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="삭제">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>














