package servlet_lifecycle;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LifeCycle")
public class ServletLifeCycle extends HttpServlet {

	@Override
	public void init() throws ServletException {
		// 서블릿 클래스에 대한 요청(= 서블릿 주소 요청) 시 자동으로 호출됨
		// => 해당 서블릿 클래스에 대한 인스턴스 생성됨
		// => 서블릿 라이프 사이클(생명 주기) 상에서 최초로 단 한 번만 실행됨(= 서버 재시작 전까지)
		// => 실제로는 오버라이딩 할 일이 없음
		System.out.println("init() 메서드 호출됨 - 서블릿 인스턴스 생성!");
		
		// 슈퍼클래스가 가진 본래의 init() 메서드의 작업 수행을 위해 직접 호출
		super.init();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// init() 메서드 호출된 후 자동으로 호출됨
		// => 서블릿 클래스의 인스턴스 내에서 쓰레드(Thread) 생성됨
		// => 사용자의 요청(= 서블릿 주소 요청)이 있을 때마다 매번 호출되며
		//    호출될 때마다 쓰레드가 하나씩 생성됨
		System.out.println("service() 메서드 호출됨 - 서블릿 쓰레드 생성!");
		
		// 슈퍼클래스가 가진 본래의 service() 메서드의 작업 수행을 위해 직접 호출
		super.service(request, response); // request, response 객체를 파라미터로 전달
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET 방식 & POST 방식 요청을 공통으로 처리할 경우 해당 메서드를 호출하여
		// 파라미터로 request, response 객체를 전달
		System.out.println("GET 방식 요청에 의해 doGet() 메서드 호출됨!");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET 방식 & POST 방식 요청을 공통으로 처리할 경우 해당 메서드를 호출하여
		// 파라미터로 request, response 객체를 전달
		System.out.println("POST 방식 요청에 의해 doPost() 메서드 호출됨!");
		doProcess(request, response);
	}
	
	// doGet(), doPost() 메서드에서 공통으로 호출할 doProcess() 메서드 정의(오버라이딩 아님!)
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET & POST 방식에 대한 공통 작업을 처리할 doProcess() 메서드 호출됨!");
		
		// POST 방식을 위한 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터로 전달받은 "name" 속성값 출력
		String name = request.getParameter("name");
		System.out.println("이름 : " + name);
	}
	
	@Override
	public void destroy() {
		// 톰캣(컨테이너) 서비스가 종료(= 서블릿 클래스 인스턴스 제거 또는 서버 중지)될 때 호출됨
		System.out.println("destroy() 메서드 호출됨 - 서비스 종료!");
		super.destroy();
	}

}









