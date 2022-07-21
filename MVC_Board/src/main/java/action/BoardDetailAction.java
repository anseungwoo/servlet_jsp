package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardDTO;

public class BoardDetailAction implements Action { 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDetailService action =new BoardDetailService();
		action.increaseReadcount(board_num);
		BoardDTO dto =action.getBoard(board_num);
		
		request.setAttribute("dto", dto);
		ActionForward forward =new ActionForward();
		forward.setPath("/board/qna_board_view.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
