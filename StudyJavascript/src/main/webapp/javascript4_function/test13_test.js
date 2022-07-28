/**
 * test13.html 파일의 자바스크립트 함수 정의하는 곳
 */
function checkNumGame() {
	/*
	정수 1개를 입력받아서 변수에 저장(num) 
	기존에 저장된 정수(correctNum)와 비교하여 일치 여부를 확인한 후
	1) 기존의 저장된 숫자가 입력받은 숫자보다 클 경우 : "입력받은 숫자보다 큽니다!" 출력
	2) 기존의 저장된 숫자가 입력받은 숫자보다 작을 경우 : "입력받은 숫자보다 작습니다!" 출력
	3) 기존의 저장된 숫자가 입력받은 숫자가 같을 경우 : "정답입니다!" 출력
	----------------------------------------------------------------------------------------
	< 옵션 >
	정답이 될 때까지 입력을 반복하면서 입력한 횟수를 계산하여 "x번만에 정답입니다!" 출력
	*/
//	let correctNum = 10; // 저장된 숫자(정답)
//	let num = prompt("정수를 입력하세요.");
//	
//	// 저장된 숫자(correctNum)와 입력받은 숫자(num) 비교
//	if(correctNum > num) {
//		alert("입력받은 숫자보다 큽니다!");
//	} else if(correctNum < num) {
//		alert("입력받은 숫자보다 작습니다!");
//	} else { // else if(correctNum == num) 와 동일
//		alert("정답입니다!");
//	}
// -----------------------------------------------------------------
	// 정답까지의 횟수를 카운팅하는 경우 => 반복 작업 필요
	let correctNum = 10; // 저장된 숫자(정답)
	let isCorrect = false; // 정답 여부를 저장하는 변수(= 반복 여부 결정하는데 활용)
	// => isCorrect 가 false 이면 반복, true 이면 반복 종료
	let count = 0; // 정답 횟수를 카운팅 할 변수
	
	// 저장된 숫자가 정답이 아닐 동안 반복
	while(!isCorrect) { // isCorrect == false 와 동일
		let num = prompt("정수를 입력하세요.");
		
		// 숫자 하나 입력받으면 카운팅 증가
		count++;
		
		// 저장된 숫자(correctNum)와 입력받은 숫자(num) 비교
		if(correctNum > num) {
			alert("입력받은 숫자보다 큽니다!");
		} else if(correctNum < num) {
			alert("입력받은 숫자보다 작습니다!");
		} else { // else if(correctNum == num) 와 동일
			alert("정답입니다!");
//			break; // 반복문 종료
			// isCorrect 변수값을 true 로 변경 => 반복문 종료됨
			isCorrect = true;
			
			alert("정답까지의 횟수 : " + count); // count 변수값을 브라우저에 출력
		}
	}
	
//	alert("정답까지의 횟수 : " + count);
	
}











