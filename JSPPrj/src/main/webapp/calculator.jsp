<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
	width: 50px;
	height: 50px;
}

.output {
	height: 50px;
	background: #e9e9e9;
	font-size: 24px;
	font-weight: bold;
	text-align: right;
	padding: 0px 5px;
}
</style>
</head>
<body>
	<form action="calc3" method="post">
		<table>
			<tr>
				<th class=output colspan="4">0</th>

			</tr>
			<tr>
				<th><input type="submit" value="CE" name="operator"></th>
				<th><input type="submit" value="C" name="operator"></th>
				<th><input type="submit" value="BS" name="operator"></th>
				<th><input type="submit" value="/" name="operator"></th>

			</tr>
			<tr>
				<th><input type="submit" value="7" name="value"></th>
				<th><input type="submit" value="8" name="value"></th>
				<th><input type="submit" value="9" name="value"></th>
				<th><input type="submit" value="*" name="operator"></th>

			</tr>
			<tr>
				<th><input type="submit" value="4" name="value"></th>
				<th><input type="submit" value="5" name="value"></th>
				<th><input type="submit" value="6" name="value"></th>
				<th><input type="submit" value="-" name="operator"></th>

			</tr>
			<tr>
				<th><input type="submit" value="1" name="value"></th>
				<th><input type="submit" value="2" name="value"></th>
				<th><input type="submit" value="3" name="value"></th>
				<th><input type="submit" value="+" name="operator"></th>

			</tr>
			<tr>
				<th></th>
				<th><input type="submit" value="0" name="value"></th>
				<th><input type="submit" value="." name="dot"></th>
				<th><input type="submit" value="=" name="operator"></th>

			</tr>
		</table>
		<div>ê²°ê³¼ê° : 0</div>
	</form>
</body>
</html>