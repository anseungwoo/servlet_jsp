package redirect_dispatcher;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RedirectTest")
public class RedirectServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RedirectServlet - doGet() 메서드 호출됨!");
		
		String name = request.getParameter("name");
		System.out.println("이름 : " + name);
		
		// Redirect 방식으로 포워딩 => redirect_result.jsp 페이지
		// => response 객체의 sendRedirect() 메서드를 호출하여 포워딩 페이지 전달
		// => 기본 문법 : response.sendRedirect("포워딩 할 페이지");
		response.sendRedirect("redirect_result.jsp");
	}

}










