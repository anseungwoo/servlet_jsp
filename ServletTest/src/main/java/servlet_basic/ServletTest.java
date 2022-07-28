package servlet_basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Servlet(서블릿)
 * - 웹에서 요청을 처리할 수 있는 자바 클래스
 * - 서블릿 클래스를 정의하려면 반드시 javax.servlet.http 패키지의 HttpServlet 클래스를 상속받아 정의
 *   => Tomcat 라이브러리 폴더가 추가되어 있거나, servlet-api.jar 파일이 Build path 로 추가되어야 함
 *      (최근 이클립스는 Tomcat 라이브러리를 자동으로 추가해줌)
 * - 서블릿 클래스가 동작하기 위해서는 입력된 요청 URL 에 맞는 클래스를 실행하기 위한 매핑 작업 필요
 *   => web.xml(배포서술자) 파일에 매핑 작업을 기술하거나, @WebServlet 어노테이션을 사용하여 매핑
 * - 서블릿 클래스는 요청 방식에 따른 작업을 처리하기 위해 GET/POST 방식에 대응하는
 *   doGet(), doPost() 메서드를 오버라이딩하여 처리할 작업을 기술해야한다!
 *   => 이 때, 각 메서드는 각 요청 방식에 따라 자동으로 호출됨
 */
public class ServletTest extends HttpServlet {

	// GET 방식에 요청에 대한 처리를 수행할 doGet() 메서드 오버라이딩하여 정의
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 현재 서블릿 클래스에 매핑된 요청이 GET 방식일 때 자동으로 호출되는 메서드
		System.out.println("ServletTest 클래스의 doGet() 메서드 호출됨!");
	}
	
}















