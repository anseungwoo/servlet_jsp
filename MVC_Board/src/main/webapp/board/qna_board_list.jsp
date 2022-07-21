<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#listForm {
	width: 1024px;
	max-height: 610px;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 1024px;
}

#tr_top {
	background: orange;
	text-align: center;
}

table td {
	text-align: center;
}

#subject {
	text-align: left;
	padding-left: 20px;
}

#pageList {
	margin: auto;
	width: 1024px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 1024px;
	text-align: center;
}

#buttonArea {
	margin: auto;
	width: 1024px;
	text-align: right;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h1>글 목록</h1>
	<section id="registFrom">
		<h2>
			글 목록<a href="BoardWriteFrom.bo">게시판 글쓰기</a>
		</h2>
		<table>
			<tr id="tr_top">
				<td width="100px">번호</td>
				<td>제목</td>
				<td width="150px">작성자</td>
				<td width="150px">날짜</td>
				<td width="100px">조회수</td>
			</tr>
			<c:if test="${boardList != null }">
				<c:forEach var="i" items="${boardList}">
					<tr onclick="location.href='BoardDetail.bo?board_num=${i.board_num }&pageNum=${pageInfo.pageNum}'">
						<td>${i.board_num }</td>
						<td id="subject">
						<c:forEach var="j" begin="1" end="${i.board_re_lev }">&nbsp;&nbsp;</c:forEach>
						${i.board_subject }</td>
						<td>${i.board_name }</td>
						<td>${i.board_date }</td>
						<td>${i.board_readcount }</td>

					</tr>
				</c:forEach>
			</c:if>
		</table>
	</section>

	<section id="buttonArea">
		<input type="button" value="글쓰기"
			onclick="location.href='BoardWriteFrom.bo'" />
	</section>

	<section id="pageList">
		
			<c:choose>
				<c:when test="${pageInfo.pageNum > 1}">
				<a href="BoardList.bo?pageNum=${pageInfo.pageNum -1 }">이전</a>
				</c:when>
				<c:otherwise>
							<span style="color: gray">이전</span>
				</c:otherwise>

			</c:choose>
		

		<c:forEach var="i" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<c:choose>
				<c:when test="${pageInfo.pageNum == i}">
					<span style="color: orange">${i }</span>
				</c:when>
				<c:otherwise>
					<a href="BoardList.bo?pageNum=${i}">${i }</a>
				</c:otherwise>

			</c:choose>
		</c:forEach>
		<c:choose>
				<c:when test="${pageInfo.pageNum < pageInfo.endPage}">
				<a href="BoardList.bo?pageNum=${pageInfo.pageNum + 1 }">다음</a>
				</c:when>
				<c:otherwise>
							<span style="color: gray">다음</span>
				</c:otherwise>
 
			</c:choose>
	
	</section>
</body>
</html>