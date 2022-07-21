package action;

import java.util.ArrayList; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.JdbcUtill;
import svc.BoardListService;
import vo.ActionForward;
import vo.BoardDTO;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction");
		
		int pageNum = 1;//현재페이지번호
		int listLimit = 10;//한페이지당 표시할 게시물 수
		int pageLimit = 10;// 한페이지당 표시할 페이지 목록 수
	
		if (request.getParameter("pageNum") != null && request.getParameter("pageNum") != "") {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		String search="";
//		String searchKind= request.getParameter("searchKind");
		if(request.getParameter("search")!=null || request.getParameter("search")!=""){
			search= request.getParameter("search"); 
		}
		BoardListService service=new BoardListService();
		int listCount=service.getlistCount();
		
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo =new PageInfo(pageNum, maxPage, endPage, startPage, listCount);
		
		
		
		
		 
		ArrayList<BoardDTO> boardList= service.selectBoardList(pageNum,listLimit,search);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageInfo", pageInfo);

		
		ActionForward forward =new ActionForward();
		forward.setPath("/board/qna_board_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
