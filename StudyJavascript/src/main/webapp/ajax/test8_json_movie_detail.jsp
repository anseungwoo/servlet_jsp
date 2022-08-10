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
		// URL 파라미터로 전달받은 영화코드(movieCd) 가져오기
		var movieCd = ${param.movieCd};
// 		alert(movieCd);
		
		// 영화 상세정보 요청 URL 생성
		var movieDetailUrl = 
			"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?" +
					"key=f5eef3421c602c6cb7ea224104795888&movieCd=" + movieCd;
		
		// AJAX 를 사용하여 movieCd 값에 해당하는 영화 상세정보 요청 후
		// 영화제목(국문, 영문), 개봉일, 상영시간, 감독, 출연진 출력
		$.ajax({
				type: "get",
				url: movieDetailUrl,
				dataType: "json"
		})
		.done(function(data) {
			// movieInfoResult 객체 내의 movieInfo 객체 내에서 각 항목 파싱
			// 영화제목(국문(movieNm), 영문(movieNmEn))
			// 개봉일(openDt)
			// 상영시간(showTm)
			// 감독(directors 배열의 peopleNm)
			// 출연진(actors 배열의 peopleNm)
			
			var movieInfo = data.movieInfoResult.movieInfo;
			
			$("#resultArea").empty(); // 출력 위치 요소 초기화
			$("#resultArea").append("영화명 : " + movieInfo.movieNm + "(" + movieInfo.movieNmEn + ")<br>");
			$("#resultArea").append("개봉일 : " + movieInfo.openDt + "<br>");
			$("#resultArea").append("상영시간 : " + movieInfo.showTm + "분<br>");
			
			$("#resultArea").append("감독 : ");
			// 감독(directors 배열) 목록을 차례대로 접근하여 감독명 출력
			for(var director of movieInfo.directors) {
				$("#resultArea").append(director.peopleNm + " ");
			}
			$("#resultArea").append("<br>");
			
			$("#resultArea").append("출연진 : ");
			// 출연진(actors 배열) 목록을 차례대로 접근하여 출연진 이름 출력
			for(var actor of movieInfo.actors) {
				$("#resultArea").append(actor.peopleNm + " ");
			}
			$("#resultArea").append("<br>");
			
		})
		.fail(function() {
			$("#resultArea").html("JSON 데이터 요청 실패!");
		});
		
	});
</script>
</head>
<body>
	<h1>test8_json_movie_detail.jsp</h1>
	<h1>영화 상세정보</h1>
	<div id="resultArea"></div>
</body>
</html>
















