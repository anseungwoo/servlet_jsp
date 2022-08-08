<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("form").submit(function() {
// 			$("#selectBox > option").eq(0).prop("selected");			
// 			$("#selectBox > option[value=선택하세요]").prop("selected");

			if($("#selectBox > option").eq(0).prop("selected")){
				alert("항목선택 필수"); 
				return false;
			}
			else{
				return true;
				
			}
		});

	});
</script>
</head>
<body>
<h1>jQuery - test7.jsp</h1>
<form action="test7_result.jsp">
	<div id="inputBox">
	아이디 : <input type="text" name="id"><br>
	패스워드 : <input type="password" name="password">
	</div>
	<select id="selectBox" name="subject">
		<option value="">선택하세요</option>
		<option value="자바">자바</option>
		<option value="JSP">JSP</option>
		<option value="SPRING">SPRING</option>
	
	</select>
	<br>
	<input type="submit" value="전송">


</form>

</body>
</html>