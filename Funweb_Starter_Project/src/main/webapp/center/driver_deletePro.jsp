

<%@page import="board.FileBoardDTO"%>
<%@page import="board.FileBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("passwd");
FileBoardDTO dto = new FileBoardDTO();
dto.setIdx(idx);
dto.setPass(passwd); 

FileBoardDAO dao = new FileBoardDAO();
   
boolean isCorrect= dao.checkPass(dto);   
if(isCorrect){
	int deleteCount = dao.deleteBoard(dto);   
if(deleteCount == 0) {
	%>
	<script>
		alert("패스워드 틀림!");
		history.back();
	</script>
	<%
} else {
	response.sendRedirect("./driver.jsp");
}
}else{
	%>
	<script>
		alert("삭제 권환이 없다!");
		history.back();
	</script>
	<%
}
%>











