package servlet_basic2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿주소 "/ItemList" 매핑 => GET 방식 요청 처리를 위한 메서드 오버라이딩
// => URL 파라미터로 전달받는 "itemCode" 파라미터값 출력해보기
// => 요청 주소 : http://localhost:8080/ServletTest/ItemList?itemCode=1111
@WebServlet("/ItemList")
public class ServletTest2 extends HttpServlet {
	/*
	 * 서블릿 요청 시 서블릿 클래스 인스턴스 생성 -> init() -> service() 메서드 자동 호출 후
	 * 요청 방식(method)에 따라 doGet() 또는 doPost() 메서드를 자동으로 호출하게 된다.
	 * => 이 때, 두 메서드 모두 요청 처리를 위한 요청 및 응답 객체를 파라미터로 전달받음
	 *    (HttpServletRequest 객체 = 요청, HttpServletResponse 객체 = 응답)
	 * => jsp 에서는 내장 객체 형태로 사용했지만, 자바 코드 내에서는 내장 객체가 존재하지 않으므로
	 *    파라미터를 통해 전달받아 사용해야 함(파라미터는 톰캣이 자동으로 전달해줌)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ItemList");
		
		// doGet() 메서드 파라미터로 전달받은 HttpServletRequest 객체의 getParameter() 메서드를 호출하여
		// URL 파라미터로 전달받은 itemCode 파라미터값 접근 가능
		String itemCode = request.getParameter("itemCode");
		System.out.println("상품 코드 : " + itemCode);
		
	}
	
}











