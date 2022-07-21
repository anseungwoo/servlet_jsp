package action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardDTO;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWriteProAction");
		
		String uploadPath = "/upload";
		ServletContext context=request.getServletContext();
		String realPath = context.getRealPath(uploadPath);
	    String encType = "UTF-8";
	    int maxSize = 10 * 1024 * 1024;
	    int insertCount=0;
	    
	    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,
                encType, new DefaultFileRenamePolicy());
	    
		String name = multi.getParameter("board_name");
		String pass = multi.getParameter("board_pass");
		String subject = multi.getParameter("board_subject");
		String content = multi.getParameter("board_content");
	
		String realFile = multi.getFilesystemName("board_file");
	    String originalFile = multi.getOriginalFileName("board_file");
	    String type = multi.getContentType("board_file");
	    File file = multi.getFile("board_file");
	
		System.out.println("글쓰기 비지니스로직");
		
		BoardDTO dto=new BoardDTO();
		dto.setBoard_name(name);
		dto.setBoard_pass(pass);
		dto.setBoard_subject(subject);
		dto.setBoard_content(content);
		dto.setBoard_file(originalFile);
		dto.setBoard_realFile(realFile);
		System.out.println(dto.toString());
		
		BoardWriteProService service =new BoardWriteProService();
		boolean isWriteSuccess =service.registBoard(dto); 
		ActionForward forward =null;
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			forward =new ActionForward();
			forward.setPath("BoardList.bo");
			forward.setRedirect(true);
			
		}
		return forward;
		
		
	}

}
