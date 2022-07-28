package servlet_basic2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Item")
public class ServletTest3 extends HttpServlet {
	
	// GET 방식 요청일 경우 자동으로 호출되는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 전달받을 "itemCode" 값 출력
//		System.out.println("doGet(/Item) 의 itemCode : " + request.getParameter("itemCode"));
		
		// 공통 메서드인 doProcess() 메서드 호출
		// => 파라미터로 HttpServletRequest, HttpServletResponse 객체 전달
		doProcess(request, response);
	}

	// POST 방식 요청일 경우 자동으로 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 전달받을 "itemCode" 값 출력
//		System.out.println("doPost(/Item) 의 itemCode : " + request.getParameter("itemCode"));

		// 공통 메서드인 doProcess() 메서드 호출
		// => 파라미터로 HttpServletRequest, HttpServletResponse 객체 전달
		doProcess(request, response);
	}
	
	// GET 방식과 POST 방식 요청에 대해 공통으로 작업을 처리할 doProcess() 메서드 정의(오버라이딩X)
	// => 파라미터로 doGet() 또는 doPost() 와 같이 HttpServletRequest, HttpServletResponse 필요
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST 방식일 때 한글 파라미터 인코딩 방식 지정
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터로 전달받을 "itemCode" 값 출력
		System.out.println("doProcess(/Item) 의 itemCode : " + request.getParameter("itemCode"));
	}

}









