/**
 * 
 */
// 외부로부터 정수 1개를 전달받아 정답과 비교하여 결과를 출력하는 checkNumGame2() 함수 정의
// => 전달인자 : 정수 1개(=> 매개변수 num 에 저장)
function checkNumGame2(num) {
	let correctNum = 10; // 저장된 숫자(정답)
	
	// 저장된 숫자(correctNum)와 입력받은 숫자(num) 비교
	if(correctNum > num) {
		alert("입력받은 숫자보다 큽니다!");
	} else if(correctNum < num) {
		alert("입력받은 숫자보다 작습니다!");
	} else { // else if(correctNum == num) 와 동일
		alert("정답입니다!");
	}
}

// 외부로부터 패스워드를 전달받아(매개변수 pass 에 저장하기) 
// 기존 패스워드(correctPasswd) 비교하여 "1234" 일 경우 "패스워드 일치!" 출력하고
// 아니면, "패스워드 불일치!" 출력하는 checkPassword() 함수 정의
// => checkPassword(passwd) 형태로 호출되어 있음
function checkPassword(pass) {
	if(pass == "1234") {
		alert(pass + " : 패스워드 일치!");
	} else {
		alert(pass + " : 패스워드 불일치!");
	}
}

// 아이디(id) 와 패스워드(pass) 를 전달받아 로그인 판별 작업을 수행하는 login() 함수 정의
function login(id, pass) {
//	alert("id : " + id + ", pass : " + pass);
	alert("입력하신 아이디는 " + id + " 이고, 패스워드는 " + pass + " 입니다.");
	// if문을 사용하여 id, pass 판별(순서 무관)
	// ex) 아이디가 "admin" 이고 패스워드가 "1234" 일 경우 "로그인 성공!" 출력하고
	//     아이디가 "admin" 이 아니면 "존재하지 않는 아이디!" 출력하고
	//     아이디가 "admin" 이고, 패스워드가 "1234" 가 아닐 경우 "패스워드 틀림!" 출력하기
//	if(id == "admin" && pass == "1234") { // 아이디, 패스워드 일치할 경우
//		alert("로그인 성공!");
//	} else if(id != "admin") { // 아이디가 일치하지 않을 경우
//		alert("존재하지 않는 아이디!");
//	} else if(id == "admin" && pass != "1234") { // 아이디가 일치하고, 패스워드가 일치하지 않을 경우
//		alert("패스워드 틀림!");
//	}

	// 로그인 판별 다른 방법
	// => 아이디 일치 vs 불일치를 먼저 판별한 후
	//    아이디가 일치할 경우에만 패스워드를 비교
	if(id == "admin") { // 아이디가 일치할 경우
//		alert("존재하는 아이디!");
		
		// 아이디가 일치할 경우에만 패스워드 일치 여부 판별
		if(pass == "1234") { // 패스워드가 일치할 경우
			alert("로그인 성공!");
		} else { // 패스워드가 일치하지 않을경우(else if(pass != "1234") 와 동일한 문장)
			alert("패스워드 틀림!");
		}
	} else { // 아이디가 일치하지 않을 경우(else if(id != "admin") 와 동일한 문장)
		alert("존재하지 않는 아이디!");
	}
	
} 















