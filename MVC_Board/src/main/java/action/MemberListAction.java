package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberListService;
import vo.ActionForward;
import vo.MemberDTO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		MemberListService service =new MemberListService();
		ArrayList<MemberDTO> list=service.getMemberList();
		forward = new ActionForward();
		forward.setPath("/member_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
