<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// check_id.html 파일을 새창에서 열기
	function checkDuplicateId() {
		window.open("MemberLoginCgeck.me", "check_id", "width=400,height=300");
	}

	// 이메일 도메인 선택 시 email2 영역에 선택된 도메인 표시
	function changeDomain() {
		document.fr.email2.value = document.fr.emailDomain.value;
	}
	

	
	// submit 버튼 클릭 시 모든 입력 항목에 대한 확인 작업
	function checkForm() {

		// 하나라도 입력되지 않은 경우 공통적으로 false 리턴하여 submit 동작 취소
		return false;	
	}
	  function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	               
	            }
	        }).open();
	    }
</script>
</head>
<body>
<h1>회원가입</h1>
	<form action="MemberJoinPro.me" method="post" name="fr">
		<table border="1">
			<tr><td>이름</td><td><input type="text" name="name" required="required"></td></tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" placeholder="ID중복확인 클릭" 
							onchange="checkIdLength()" required="required" readonly="readonly">
					<input type="button" value="ID중복확인" onclick="checkDuplicateId()">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력" 
							onchange="checkPasswdLength()" required="required">
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2" onkeyup="checkConfirmPasswd()" required="required">
					<span id="confirmPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" required="required" >@
					<input type="text" name="email2" required="required">
					<select name="emailDomain" onchange="changeDomain()">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="sample4_postcode" name="post_code" readonly="readonly" placeholder="우편번호" onclick="execDaumPostcode()">
					<input type="button" onclick="execDaumPostcode()"  value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="address1" readonly="readonly" placeholder="도로명주소" onclick="execDaumPostcode()">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" name="address2" placeholder="상세주소">
	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>