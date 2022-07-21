<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro1.jsp - request 객체 처리 페이지</h1>
	<%--
	requestForm1.jsp 페이지의 전송(submit) 버튼 클릭하면
	form 태그 내의 데이터(= 폼 파라미터)가 내장 객체인 request 객체에 자동으로 저장되고
	action 속성에 지정된 페이지(또는 파일)로 이동(요청)하면서 request 객체가 전달됨
	=> 요청에 관련된 모든 정보는 request 객체가 관리(= 자동으로 생성되는 객체 = 내장 객체)
	   요청 정보에 접근하려면 request.메서드명() 형태로 접근
	=> 요청받은 페이지에서 request 객체에 저장된 폼 파라미터(데이터)를 가져오는 방법
	   1) String request.getParameter(String name)
	      => request.getParameter("파라미터명")
	      => 전달된 파라미터 중 단일 항목 파라미터 가져오기
	      => 메서드 호출 시 전달하는 전달인자는 String 타입(name)이며
	         form 태그 내의 요소에 지정된 name 속성값을 이름으로 지정
	      => 리턴되는 데이터는 String 타입
	   2)    
	--%>
	<%
	// --------------------------------------------------------------------------
	// 주의! 만약, requestForm1.jsp 페이지에서 POST 방식으로 정보를 요청했을 경우
	// 응답 페이지(requestPro1.jsp)에서 별도의 한글 처리 필수!
	// => request 객체의 setCharacterEncoding() 메서드를 호출하여 "UTF-8" 지정
	//    (request 객체의 문자데이터들의 인코딩 방식을 유니코드(UTF-8) 방식으로 설정)
	request.setCharacterEncoding("UTF-8");
	// => 파라미터 값을 가져오는 코드(request.getParameter() 등) 보다 먼저 수행 필수!
	// --------------------------------------------------------------------------
	// 1. 폼 파라미터 중 파라미터명(name 속성명)이 "name" 인 값을 가져와서 strName 변수에 저장
	String strName = request.getParameter("name");
	// 주의! name 속성명이 잘못 입력됐을 경우 파라미터가 존재하지 않으므로 null 값이 리턴됨
// 	String strName = request.getParameter("name1"); // null 값 리턴됨
// 	out.println("이름 : " + strName);

	// 2. 폼 파라미터 중 파라미터명(name 속성명)이 "age" 인 값을 가져와서 strAge 변수에 저장
	String strAge = request.getParameter("age");
	// 만약, 나이를 연산에 사용하기 위해 문자열 데이터를 정수형 데이터로 변환해야할 경우(중요!)
	// => Integer.parseInt("정수문자열"); => 문자열을 정수로 변환하여 int 타입으로 리턴
	int age = Integer.parseInt(strAge);
	
	// 3. 폼 파라미터 중 파라미터명(name 속성명)이 "gender" 인 값을 가져와서 strGender 변수에 저장
	String strGender = request.getParameter("gender");
	
	// 4. 폼 파라미터 중 파라미터명(name 속성명)이 "hobby" 인 값을 가져와서 strHobby 변수에 저장
// 	String strHobby = request.getParameter("hobby");
	// => 주의! checkbox 처럼 복수개의 데이터가 하나의 파라미터명으로 전달될 경우
	//    getParameter() 메서드로는 하나의 데이터만 가져올 수 있음.
	//    따라서, getParameterValues() 메서드 호출하여 복수개의 데이터를 String[] 타입으로 처리 필수!
	// 파라미터명이 "hobby" 인 취미 항목 복수개를 가져와서 String[] 타입 strHobbies 에 저장
	String[] strHobbies = request.getParameterValues("hobby");
	%>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=strName %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=strAge %>, <%=age %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<%--
				strHobbies 배열 내의 인덱스가 고정이 아니므로(데이터 갯수가 달라지므로)
				0 ~ 2 번 인덱스까지 무조건 접근 시 오류 발생할 수 있음
				--%>
<%-- 				<%=strHobbies[0] %>, <%=strHobbies[1] %>, <%=strHobbies[2] %> --%>

				<%-- 
				for문을 활용하여 strHobbies 배열 크기만큼 반복 작업을 통해 데이터 접근
				=> 단, 체크박스를 하나도 체크하지 않을 경우 getParameterValues() 메서드 호출 결과는
				   null 값이 전달되므로 strHobbies.length 실행 시 오류 발생함!
				=> 따라서, strHobbies 가 null 일 경우 별도의 처리 작업 필요
				   ex) strHobbies 가 null 이면 자바스크립트를 통해 
				       "취미 선택 필수" 메세지 출력 후 이전페이지로 돌아가기 
				--%>
				<%
				if(strHobbies == null) {
					// strHobbies 가 null 일 경우 아래쪽의 HTML 태그(자바스크립트 코드) 포함시켜 전송
				%>
					<!-- 이 위치는 strHobbies 가 null 일 때 실행할 HTML 태그가 위치 -->
					<script type="text/javascript">
						alert("취미 선택 필수!");
						history.back();
					</script>
				<%	
				} else { // 하나라도 체크했을 경우 항목 출력
					for(int i = 0; i < strHobbies.length; i++) {
						out.println(strHobbies[i]);
					}
				}
				%>
			</td>
		</tr>
	</table>
</body>
</html>










