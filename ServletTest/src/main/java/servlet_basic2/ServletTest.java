package servlet_basic2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * web.xml(배포서술자) 에 서블릿 요청에 대한 매핑을 기술할 수도 있지만
 * 서블릿 클래스 선언부 위에 @WebServlet 어노테이션을 기술하여 매핑 수행도 가능(간편) 
 * => 클래스 선언부 위에 @WebServlet("매핑할 URL 패턴") 형식으로 매핑 작업 수행
 * 
 * < 주의! > 
 * 하나의 프로젝트 내에서 web.xml 의 서블릿 매핑 또는 다른 서블릿 클래스의 @WebServlet 어노테이션과
 * 중복해서 사용은 가능하나, 서블릿 주소(URL)는 중복을 허용하지 않는다!          
 */
//@WebServlet("/MyServlet")
//@WebServlet("/MyServlet.test")
//@WebServlet("/servlet_basic/Test")
@WebServlet("*.do")
public class ServletTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("@WebServlet 어노테이션을 사용한 ServletTest 클래스");
	}
	
}















