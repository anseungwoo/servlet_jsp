<%@page import="board.FileBoardDAO"%>
<%@page import="board.FileBoardDTO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String uploadPath = "/upload";
	ServletContext context=request.getServletContext();
	String realPath = context.getRealPath(uploadPath);
    String encType = "UTF-8";
    int maxSize = 10 * 1024 * 1024;
    int insertCount=0;
    try {
        MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,
                encType, new DefaultFileRenamePolicy());
        String name=multi.getParameter("name");
        String pass=multi.getParameter("pass");
        String subject=multi.getParameter("subject");
        String content=multi.getParameter("content");
        String realFile = multi.getFilesystemName("file");
        String originalFile = multi.getOriginalFileName("file");
        String type = multi.getContentType("file");
        File f = multi.getFile("file");
        
        FileBoardDTO dto =new FileBoardDTO();
        dto.setName(name);
        dto.setPass(pass); 
        dto.setSubject(subject);
        dto.setContent(content);
        dto.setRealFile(realFile);
        dto.setOriginalFile(originalFile);
        FileBoardDAO dao=new FileBoardDAO();
        insertCount=dao.insertFileBoard(dto);   
        
        
        
        
        
        out.println("user: " + name + "<br/>");
        out.println("title: " + pass + "<br/>");
        out.println("user: " + subject + "<br/>");
        out.println("title: " + content + "<br/>");
        out.println("<hr>");
        out.println("저장된 파일 이름 : " + realFile + "<br/>");
        out.println("실제 파일 이름 : " + originalFile + "<br/>");
        out.println("파일 타입 : " + type + "<br/>");
        if (f != null) {
            out.println("크기 : " + f.length()+"바이트");
            out.println("<br/>");
        }
    } catch (IOException ioe) {
        System.out.println(ioe);
    } catch (Exception ex) {
        System.out.println(ex);
    }
    
    if(insertCount == 0) {
    	%>
    	<script>
    		alert("글쓰기 실패!");
    		history.back();
    	</script>
    	<%
    } else {
    	response.sendRedirect("driver.jsp");
    }
%>   



