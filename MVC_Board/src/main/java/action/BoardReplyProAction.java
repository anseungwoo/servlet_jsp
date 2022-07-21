package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardDTO;

public class BoardReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String board_name=request.getParameter("board_name");
		String board_pass=request.getParameter("board_pass");
		String board_subject=request.getParameter("board_subject");
		String board_content=request.getParameter("board_content");
		int board_re_ref=Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev=Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq=Integer.parseInt(request.getParameter("board_re_seq"));
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		ActionForward forward=null;
		
		
		
		BoardDTO dto =new BoardDTO();
		dto.setBoard_name(board_name);
		dto.setBoard_pass(board_pass);
		dto.setBoard_subject(board_subject);
		dto.setBoard_content(board_content);
		dto.setBoard_re_seq(board_re_seq);
		dto.setBoard_re_lev(board_re_lev);
		dto.setBoard_re_ref(board_re_ref);
		dto.setBoard_num(board_num);
		
		System.out.println(dto);
		BoardReplyProService service =new BoardReplyProService(); 
		
		boolean isReplySuccess = service.replyBoard(dto);
		
		// 삭제 결과 판별
		// 삭제 실패 시 자바스크립트로 "삭제 실패!" 출력 후 이전페이지로 돌아가기
		if(!isReplySuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록 실패!')");
			out.println("history.back()"); 
			out.println("</script>");
		} else {
			// 글목록(BoardList.bo) 페이지 요청 => 페이지번호 전달
			
			forward =new ActionForward();
			forward.setPath("BoardList.bo?pageNum=" + request.getParameter("pageNum"));
			forward.setRedirect(true);
		}
	
		 
		
		
		return forward;
	}

}
