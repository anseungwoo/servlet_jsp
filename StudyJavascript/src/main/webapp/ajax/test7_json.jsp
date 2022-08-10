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
		$("#btnOk").on("click", function() {
			$.ajax({
				type: "get",
				url: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220807",
				dataType: "json"
			})
			.done(function(data) {
				// 전송받은 영화정보 JSON 객체를 문자열로 변환하여 출력 - JSON.stringify()
// 				$("#resultArea").html(JSON.stringify(data));
// 				var jsonStringifyData = JSON.stringify(data);
// 				$("#resultArea").html(jsonStringifyData);
// 				alert(typeof(jsonStringifyData)); // string
				
				// 문자열로 된 JSON 데이터를 JSON 객체 형태로 변환(= Parsing = 파싱)
				// => JSON 객체의 parse() 함수 활용
// 				var jsonParseData = JSON.parse(jsonStringifyData); // string -> JSON 객체 변환
// 				alert(jsonParseData + " : " + typeof(jsonParseData));

				// ----------------------------------------------------------------------------
				// 영화정보 API 가 저장된 data 객체로부터 영화 정보 추출하기
				// 1. 일별 박스오피스 목록 10개가 저장된 "boxOfficeResult" 객체 추출
				var boxOfficeResult = data.boxOfficeResult;
// 				alert(boxOfficeResult + " : " + typeof(boxOfficeResult));
// 				$("#resultArea").html(JSON.stringify(boxOfficeResult));

				// 2. 박스오피스 타입(boxofficeType)과 조회날짜범위(showRange) 추출
				// => 주의! 전체 정보(data)가 아닌 일별 박스오피스 전체정보(boxOfficeResult)에서 추출
				var boxOfficeType = boxOfficeResult.boxofficeType;
				var showRange = boxOfficeResult.showRange;
				$("#resultArea").prepend(
						JSON.stringify(boxOfficeType) + "(" + JSON.stringify(showRange) + ")");
				
				// 3. 일별 박스오피스 영화 목록(dailyBoxOfficeList) 추출
				// => 복수개의 영화 정보 객체{} 가 dailyBoxOfficeList 라는 이름의 배열[] 로 저장됨
				var dailyBoxOfficeList = boxOfficeResult.dailyBoxOfficeList;
// 				alert(dailyBoxOfficeList + " : " + typeof(dailyBoxOfficeList));
				
				// 4. 추출된 박스오피스 목록(배열)을 반복문을 통해 반복하면서 
				// 순위(rank), 제목(movieNm), 개봉일(openDt), 누적관객수(audiAcc) 추출 및 출력
				for(var i = 0; i < dailyBoxOfficeList.length; i++) {
					$("#resultArea > table").append(
						"<tr>" + 
						"<td>" + dailyBoxOfficeList[i].rank + "</td>" +
						"<td>" + dailyBoxOfficeList[i].movieNm + "</td>" + 
						"<td>" + dailyBoxOfficeList[i].openDt + "</td>" + 
						"<td>" + dailyBoxOfficeList[i].audiAcc + "</td>" + 
						"</tr>"							
					);
				}
				
			})
			.fail(function() {
				$("#resultArea").html("JSON 데이터 요청 실패!");
			});
		});
	});
</script>
</head>
<body>
	<h1>test7_json.jsp</h1>
	<input type="button" value="영화정보 데이터 파싱하기" id="btnOk">
	<div id="resultArea">
		<table border="1">
			<tr>
				<th width="80">현재순위</th>
				<th width="400">영화명</th>
				<th width="150">개봉일</th>
				<th width="100">누적관객수</th>
			</tr>
		</table>
	</div>
</body>
</html>















