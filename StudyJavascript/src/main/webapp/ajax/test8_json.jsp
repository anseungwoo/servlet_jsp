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
			var selectedDate = $("#date").val();
// 			alert("선택된 날짜 : " + selectedDate);

			// 날짜가 선택되지 않은 경우 "날짜 선택 필수!" 메세지 출력 후 날짜에 포커스 및 return
			if(selectedDate.length == 0) {
				alert("날짜 선택 필수!");
				$("#date").focus(); // 날짜 선택 요소에 포커스
				return; // 현재 함수 실행 종료
			}
			
			// 문자열 치환(변경)을 통해 "-" 기호 제거하는 방법
			// 1) split() 함수를 통해 문자열 분리 방법
// 			var date = selectedDate.split("-"); // "-" 기호를 기준으로 각 문자열 분리 후 배열로 저장
// 			var targetDt = date[0] + date[1] + date[2]; // 3개의 문자열 연결
// 			alert(targetDt); // 20220822

			// 2) replace() 함수를 통해 문자열 치환 방법("-" 문자열을 "" 문자열로 치환)
// 			var targetDt = selectedDate.replace("-", ""); // 처음 만나는 "-" 문자열만 치환(202208-10)
			// 정규표현식을 사용하여 대상 문자열을 패턴문자열로 지정
			// => 이 때, 복수개의 "-" 기호를 지정하려면 정규표현식 패턴 뒤에 g 라는 flag 표시
			//    (g : global 의 의미로 대상 문자열 내의 모든 패턴 검색)
			//    (i : ignore case 의 의미로 대소문자 무시하고 검색)
			//    (m : multi line 의 의미로 문자열이 복수개의 라인으로 구성될 경우 전체 라인 검색)
			//    => 위의 플래그들은 /x 의 형식으로 복수개 조합도 가능
			//       ex) /패턴문자열/g/m  =>  전체 문자열을 대상으로 복수개의 라인에서 패턴 검색
			//           /패턴문자열/g/i  =>  전체 문자열을 대상으로 대소문자 구별 없이 패턴 검색
			var targetDt = selectedDate.replace(/-/g, "");
// 			alert(targetDt);
			
			$.ajax({
				type: "get",
				url: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + targetDt,
				dataType: "json"
			})
			.done(function(data) {
				// 조회 후 재 조회 시 prepend(), append() 함수로 인해 중복 표시 방지하기 위해
				// 기존에 표시된 "#resultArea" 영역 내의 모든 요소 제거
// 				#("#resultArea").empty();
				
				// "#resultArea" 영역에 html() 함수를 통해 기본 테이블 생성(empty() 불필요)
				$("#resultArea").html(
					"<table border='1'>" + 
						"<tr>" +
							"<th width='80'>순위</th>" +
							"<th width='400'>영화명</th>" +
							"<th width='150'>개봉일</th>" +
							"<th width='100'>누적관객수</th>" +
						"</tr>" +
					"</table>"
				);
				
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
// 					$("#resultArea > table").append(
// 						"<tr>" + 
// 						"<td>" + dailyBoxOfficeList[i].rank + "</td>" +
// 						"<td>" + dailyBoxOfficeList[i].movieNm + "</td>" + 
// 						"<td>" + dailyBoxOfficeList[i].openDt + "</td>" + 
// 						"<td>" + dailyBoxOfficeList[i].audiAcc + "</td>" + 
// 						"</tr>"							
// 					);


					// 영화제목(movieNm)에 하이퍼링크를 설정하여 영화 상세정보 조회 페이지로 이동
					// => 이동할 페이지 : test8_json_movie_detail.jsp
					// => 파라미터 : 영화코드(movieCd)
					$("#resultArea > table").append(
						"<tr>" + 
						"<td>" + dailyBoxOfficeList[i].rank + "</td>" +
						"<td>" + "<a href='test8_json_movie_detail.jsp?movieCd=" + dailyBoxOfficeList[i].movieCd + "'>" + dailyBoxOfficeList[i].movieNm + "</a>" + "</td>" + 
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
	<h1>test8_json.jsp</h1>
	<input type="date" id="date">	
	<input type="button" value="일자별 박스오피스 검색" id="btnOk">
	<div id="resultArea"></div>
</body>
</html>















