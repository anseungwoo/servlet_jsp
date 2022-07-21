package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

@WebServlet("*.do")
public class BoardFrontController2 extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Board 서블릿 *.do");
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println(command);
		ActionForward forward =null;
		if (command.equals("/BoardList.do")) {
			forward=new ActionForward();
			forward.setPath("/board/qna_board_list.jsp");
			forward.setRedirect(false);
//		
		}
		else if (command.equals("/BoardWriteFrom.do")) {  
			System.out.println("글쓰기 폼");
			forward=new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
			forward.setRedirect(false);
		
		}else if (command.equals("/BoardWritePro.do")) {  
			System.out.println("글쓰기 폼");
			forward=new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
			forward.setRedirect(true);
		
		}
		if(forward !=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
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
