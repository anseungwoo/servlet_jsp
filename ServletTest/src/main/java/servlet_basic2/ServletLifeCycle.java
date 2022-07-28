package servlet_basic2;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletLifeCycle
 */
@WebServlet("/LifeCycle")
public class ServletLifeCycle extends HttpServlet {

	public ServletLifeCycle() {
		super();
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 매서드 호출됨");
		super.init();
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("쓰레드 생성");
		super.service(request, response);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dopost");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget && dopost 처리");
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		System.out.println(name);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy 종료");
		super.destroy();
	}

}
