package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberDTO;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("passwd");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String post_code =request.getParameter("post_code");
		String adrress1 =request.getParameter("adrress1");
		String adrress2 =request.getParameter("adrress2");
		
		MemberDTO dto =new MemberDTO();
		dto.setMember_name(name); 
		dto.setMember_id(id);
		dto.setMember_pass(pass);
		dto.setMember_email(email);
		dto.setMember_post_code(post_code);
		dto.setMember_address1(adrress1);
		dto.setMember_address2(adrress2);
		MemberJoinProService service =new MemberJoinProService();
		boolean isJoinSuccess =service.joinMember(dto);
		
		
		forward = new ActionForward();
		forward.setPath("/member/member_login.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
