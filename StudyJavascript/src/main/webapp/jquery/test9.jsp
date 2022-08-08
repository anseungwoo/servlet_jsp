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
		
		$("#selectBox").on("change", function() {
			// 			alert('확인');
			// 			alert($("#selectBox").val());
			if ($("#selectBox").val() == "VIP") {
				alert("hi");
			}
			if ($("#selectBox > option").eq(2).is(":selected")) {
				alert("hi2");
			}
		});
		
		$("#allCheck").on("change", function() {
			if ($("#allCheck").is(":checked")) {
// 				$(".check").prop("checked", true);
				$(".check").each(function(index, item){
					item.checked= true;
					
				});
			} else {
				$(".check").prop("checked", false);
			}
		});
		
	});
</script>
</head>
<body>
	<h1>jQuery - test9.jsp</h1>
	<table border="1">
		<tr>
			<td colspan="3"><select id="selectBox" name="subject">
					<option value="전체">전체</option>
					<option value="VIP">VIP</option>
					<option value="일반">일반</option>
			</select></td>
		</tr>
		<tr>
			<th><input type="checkbox" id="allCheck"></th>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<tr>
			<th><input type="checkbox" class="check"></th>
			<th>1</th>
			<th>길동</th>
		</tr>
		<tr>
			<th><input type="checkbox" class="check"></th>
			<th>2</th>
			<th>감찬</th>
		</tr>
		<tr>
			<th><input type="checkbox" class="check"></th>
			<th>3</th>
			<th>순신</th>
		</tr>

	</table>

</body>
</html>