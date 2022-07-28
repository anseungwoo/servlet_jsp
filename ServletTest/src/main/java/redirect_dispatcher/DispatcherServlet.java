package redirect_dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DispatcherTest")
public class DispatcherServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DispatcherServlet - doGet() 메서드 호출됨!");
		
		String name = request.getParameter("name");
		System.out.println("이름 : " + name);
		
		// Dispatcher 방식으로 포워딩 => dispatcher_result.jsp 페이지
		// => request 객체의 getRequestDispatcher() 메서드를 호출하여 RequestDispatcher 객체 리턴받고
		//    RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩 수행
		// => 기본 문법
		//    RequestDispatcher dispatcher = request.getRequestDispatcher("포워딩 할 페이지");
		//    dispatcher.forward(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("dispatcher_result.jsp");
		dispatcher.forward(request, response);
		// => 이전 요청에서 전달받은 request 객체를 다시 포함하여 전달함
	}

}










