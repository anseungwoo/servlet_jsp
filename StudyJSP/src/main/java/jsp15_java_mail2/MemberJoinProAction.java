package jsp15_java_mail2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinProAction");
		
		ActionForward forward = null;
		
		MemberDTO member = new MemberDTO();
		member.setName(request.getParameter("name"));
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		member.setGender(request.getParameter("gender"));
//		System.out.println(member);
		
		// MemberJoinProService - joinMember() 메서드 호출
		// => 파라미터 : MemberDTO 객체   리턴타입 : boolean(isJoinSuccess)
		MemberJoinProService service = new MemberJoinProService();
		boolean isJoinSuccess = service.joinMember(member);
		
		// isJoinSuccess 가 false 일 경우 자바스크립트를 통해 "가입 실패" 출력 후 이전페이지
		// 아니면, ActionForward 객체를 통해 메인페이지로 포워딩
		if(!isJoinSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 가입 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			// 가입 성공 시 인증 메일 발송을 위한 서블릿 주소 요청(파라미터 : 아이디, 이메일)
			forward = new ActionForward();
			forward.setPath("SendAuthMail.auth?id=" + member.getId() + "&email=" + member.getEmail());
			forward.setRedirect(true);
		}
		
		return forward;
	}

}











