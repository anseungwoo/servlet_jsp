package servlet_basic3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.me")
public class ServletTest extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*.me 서블릿 주소 매핑됨!");
		
		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// -----------------------------------------------------------------------
		// 서블릿 주소가 xxx.me 로 끝날 경우 현재 클래스 인스턴스 생성되고 doGet or doPost 메서드 호출됨
		// ex) MemberList.me   MemberJoinForm.me   MemberLoginPro.me
		// 따라서, .me 부분을 제외한 나머지 주소 부분에 대해
		// 각각 다른 작업을 수행하기 위한 주소의 문자열 분리 작업 및 판별 작업 필요
		// (즉, 주소표시줄에 입력된 URL 에서 서블릿 주소 부분을 가져와서
		//  판별을 통해 수행해야할 동작을 결정하기 위해 서블릿 주소 추출 과정 필요)
		// ex) MemberJoinForm.me 일 때와 MemberLoginForm.me 일 때의 동작이 다르므로
		//     URL 에서 서블릿 주소(프로젝트명 뒷부분 "/xxx.me")를 추출한 후
		//     문자열 비교를 통해 서블릿 주소 판별 작업을 수행해야함
		
		// 0. 참고) 요청 주소(URL) 전체 추출(가져오기)
//		String requestURL = request.getRequestURL().toString();
//		System.out.println("requestURL : " + requestURL);
		// http://localhost:8080/StudyServlet/MemberList.me
		
		// 1. 요청 주소 중 IP 주소부분까지를 제외한 URI 부분(/프로젝트명/서블릿주소) 추출
//		String requestURI = request.getRequestURI();
//		System.out.println("requestURI : " + requestURI);
		// /StudyServlet/MemberList.me
		
		// "/" 기호를 기준으로 문자열 분리 후 마지막 배열 인덱스 값을 추출하거나(split() 사용)
		// 프로젝트명 부분을 제외한 나머지 문자열을 추출하면 서블릿 주소 추출이 가능함
		// 2. 요청 주소 중 컨텍스트 경로(/프로젝트명) 부분 추출
//		String contextPath = request.getContextPath();
//		System.out.println("contextPath : " + contextPath);
		// /StudyServlet
		
		// 3. 요청 주소 중 서블릿 주소(/서블릿주소) 부분 추출
		// => requestURI 와 contextPath 를 가공하여 추출하는 방법 사용
		// => requestURI 에서 contextPath 의 길이에 해당하는 인덱스부터 부분문자열 추출(substring())
//		String command = requestURI.substring(contextPath.length());
//		System.out.println("command : " + command);
		// /MemberList.me	
		// --------------------------------------------------------------------------------------
		// 위의 1 ~ 3번 과정을 하나의 메서드로 압축하여 제공 - request 객체의 getServletPath()
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// if문을 사용하여 추출된 서블릿 주소(command)를 판별하여 각각 다른 작업 수행
		// "/MemberList.me" 와 "/MemberJoinForm.me" 를 판별
		if(command.equals("/MemberList.me")) {
			System.out.println("회원 목록 출력!");
			
			// 회원 목록을 표시할 데이터 조회를 위해 MemberListAction 클래스의 인스턴스 생성 후
			// execute() 메서드를 호출하여 데이터를 조회했다고 가정
			MemberListAction action = new MemberListAction();
			action.execute();
			
			// 만약, 조회된 회원 목록 정보가 저장된 객체를 포워딩할 페이지로 전달하려면
			// request 객체에 저장한 후 전달하는데 이 때, request 객체를 포워딩 페이지까지
			// 유지하기 위해서 Dispatcher 방식으로 포워딩을 수행해야한다!
			request.setAttribute("memberList", "회원목록");
			// 1) request 객체의 getRequestDispatcher() 메서드를 호출하여 RequestDispatcher 객체 리턴
			//    => 파라미터로 포워딩 경로 전달
			RequestDispatcher dispatcher = request.getRequestDispatcher("member_list.jsp");
			
			// 2) RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩
			//    => 파라미터로 request 객체와 response 객체 전달
			dispatcher.forward(request, response);
		} else if(command.equals("/MemberJoinForm.me")) {
			System.out.println("회원 가입 폼 출력!");
			// member_join_form.jsp 페이지로 포워딩
			// => 포워딩 할 경로를 변경하지 않고 이전 요청 URL(MemberJoinForm.me)을 유지하려면
			//    Dispatcher 방식으로 포워딩을 수행해야한다!
			// 1) request 객체의 getRequestDispatcher() 메서드를 호출하여 RequestDispatcher 객체 리턴
			//    => 파라미터로 포워딩 경로 전달
			RequestDispatcher dispatcher = request.getRequestDispatcher("member_join_form.jsp");
			
			// 2) RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩
			//    => 파라미터로 request 객체와 response 객체 전달
			dispatcher.forward(request, response);
		}
		
	}

}




















