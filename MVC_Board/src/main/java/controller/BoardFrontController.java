package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;
import vo.BoardDTO;

@MultipartConfig(
fileSizeThreshold = 1024 * 1024, 
maxFileSize = 1024 * 1024 * 50, 
maxRequestSize = 1024 * 1024 * 50 * 5
)
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Board 서블릿 *.bo");
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/BoardList.bo")) {
			try {
				action = new BoardListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/BoardWriteFrom.bo")) {
			System.out.println("글쓰기 폼");

			forward = new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/BoardWritePro.bo")) {

			try {
				action = new BoardWriteProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else if (command.equals("/BoardDetail.bo")) {

			try {
				action = new BoardDetailAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else if(command.equals("/BoardReplyForm.bo")) {
			try {
				action = new BoardReplyFormAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/BoardReplyPro.bo")) {
			try {
				action = new BoardReplyProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		 else if(command.equals("/BoardModifyForm.bo")) {
			try {
				action = new BoardModifyFormAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}else if(command.equals("/BoardModifyPro.bo")) {
			try {
				action = new BoardModifyProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardDeleteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("board/qna_board_delete.jsp");
			forward.setRedirect(false); // Dispatcher 방식(생략 가능)
		} else if(command.equals("/BoardDeletePro.bo")) {
			try {
				action = new BoardDeleteProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProcess(request, response);
	}

}
