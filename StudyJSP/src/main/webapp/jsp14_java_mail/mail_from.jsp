<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>메일 전송</h1>
 <form action="mail_pro.jsp" method="post">
 <table border="1">
 	<tr><td>보내는 사람</td><td><input type="text" name="send"> </td></tr>
 	<tr><td>받는 사람</td><td><input type="text" name="rece"> </td></tr>
 	<tr><td>제목</td><td><input type="text" name="subject"> </td></tr>
 	<tr><td>내용</td><td><textarea rows="10" cols="40" name="content"></textarea> </td></tr>
 	<tr><td colspan="2" align="center"><input type="submit" value="전송"> </td></tr>
 
 </table>
 
 
 </form>
</body>
</html>