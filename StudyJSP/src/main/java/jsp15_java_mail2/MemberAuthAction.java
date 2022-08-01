package jsp15_java_mail2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		AuthInfoDTO authInfo =new AuthInfoDTO();
		authInfo.setId(request.getParameter("id"));	
		authInfo.setAuthCode(request.getParameter("authCode"));
		System.out.println(authInfo.getId()+" "+authInfo.getAuthCode());
				 
		MemberAuthService service =new MemberAuthService();
		boolean isAuthenticationSuccess =service.isAuthentication(authInfo);
		
		if(!isAuthenticationSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('인증코드 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('인증 성공!')");
			out.println("location.href='MemberLoginForm.auth'");
			out.println("</script>");
//			forward = new ActionForward();
//			forward.setPath("Main.auth");
//			forward.setRedirect(true);
		}
		return forward;
	}

}
