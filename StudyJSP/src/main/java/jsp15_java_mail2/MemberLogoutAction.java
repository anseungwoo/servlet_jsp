package jsp15_java_mail2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogoutAction");
		
		ActionForward forward = null;
		
		// 세션 객체 가져와서 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 메인페이지 포워딩
		forward = new ActionForward();
		forward.setPath("Main.auth"); 
		forward.setRedirect(true);
		
		return forward;
	}

}













