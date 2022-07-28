package jsp15_java_mail2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberCheckDuplicateIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println();
		String id= request.getParameter("id");
		System.out.println(id);
		MemberCheckDuplicateIdService service =new MemberCheckDuplicateIdService();
		boolean isDuplicate = service.checkDuplicateId(id);
		if(isDuplicate) {
			System.out.println("아이디중복");
			forward = new ActionForward();
			forward.setPath("MemberLoginCheck.me?id="+id+"&isDuplicate="+isDuplicate);
			forward.setRedirect(true);
		}else {
		System.out.println("아이디 사용가능");
			forward = new ActionForward();
			forward.setPath("MemberLoginCheck.me?id="+id+"&isDuplicate="+isDuplicate);
			forward.setRedirect(true);
		}
	
		return forward;
	}

}
