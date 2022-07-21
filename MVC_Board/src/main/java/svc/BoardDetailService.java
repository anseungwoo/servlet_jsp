package svc;

import static db.JdbcUtill.close;
import static db.JdbcUtill.commit;
import static db.JdbcUtill.getConnection;
import static db.JdbcUtill.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardDTO;

public class BoardDetailService {
	
	public BoardDTO getBoard(int board_num) {
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance(); 
		dao.setConnection(con); 
		
		BoardDTO dto = dao.selectBoard(board_num);
		close(con);
		return dto;
		
		
	}
 
	public void increaseReadcount(int board_num) {
		
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance(); 
		dao.setConnection(con); 
		
		int updateCount = dao.updateReadcount(board_num);
		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);

		}
		close(con);
		
	}

}
