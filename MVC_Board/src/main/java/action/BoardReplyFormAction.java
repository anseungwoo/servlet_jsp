package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import svc.BoardReplyService;
import vo.ActionForward;
import vo.BoardDTO;

public class BoardReplyFormAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardReplyService action =new BoardReplyService();
		BoardDTO dto =action.getBoard(board_num);
		 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		ActionForward forward =new ActionForward();
		forward.setPath("/board/qna_board_reply.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
