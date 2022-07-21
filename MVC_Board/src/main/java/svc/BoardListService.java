package svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import dao.BoardDAO;
import static db.JdbcUtill.*;
import vo.BoardDTO;


public class BoardListService {
	public ArrayList<BoardDTO> selectBoardList(int pageNum,int listLimit,String search) {
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
	
		if(search !=null || search !=""){ 
			search= ""; 
		} 

	
		 
		ArrayList<BoardDTO> list = dao.selectBoardList(pageNum, listLimit,search,"board_subject");
		
	
		close(con); 
		return list;
		
	}
	public int getlistCount() {
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		int listCount=dao.selectListCount();
		close(con); 
		return listCount;
	}

}
