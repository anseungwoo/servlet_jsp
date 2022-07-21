package svc;

import static db.JdbcUtill.close;
import static db.JdbcUtill.getConnection;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardDTO;

public class BoardReplyService {
	public BoardDTO getBoard(int board_num) {
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance(); 
		dao.setConnection(con); 
		
		BoardDTO dto = dao.selectBoard(board_num);
		close(con);
		return dto;
		
		
	}
}
