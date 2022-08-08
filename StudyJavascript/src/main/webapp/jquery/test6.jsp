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
		$("input[type=button]").click(function() {
			
			var attr1=$("input[type=checkbox]").eq(1).attr("checked");
			var prop1=$("input[type=checkbox]").eq(1).prop("checked");
			
			var attr2=$("input[type=checkbox]").eq(2).attr("checked");
			var prop2=$("input[type=checkbox]").eq(2).prop("checked");
			
			var is1=$("input[type=checkbox]").eq(1).is(":checked");
			var is2=$("input[type=checkbox]").eq(2).is(":checked");
			$("#result").html(
			"attr1 = " + attr1 +" , prop1 = "+ prop1 +
			"<br>attr2 = " + attr2 +" , prop2 = "+ prop2+
			"<br>is1 = " + is1 +" , is2 = "+ is2
			);
		});
		
		
		
		
	});
</script>
</head>
<body>
	<h1>jQuery - test6.jsp</h1>
	<table border="1">
        <tr>
            <th><input type="checkbox" id="allCheck"></th>
            <th>번호</th>
            <th>이름</th>
        </tr>
        <tr>
            <td><input type="checkbox" id="check1" name="check" checked="checked" value="1"></td>
            <td>1</td>
            <td>홍길동</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="2"></td>
            <td>2</td>
            <td>이순신</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="3"></td>
            <td>3</td>
            <td>강감찬</td>
        </tr>
        <tr>
        	<td colspan="3">
        		<input type="button" value="확인"><br>
        		<div id="result">결과 확인 위치</div>
        	</td>
        </tr>
    </table>
</body>
</html>









