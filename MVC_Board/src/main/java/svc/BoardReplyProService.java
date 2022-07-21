package svc;

import static db.JdbcUtill.close;
import static db.JdbcUtill.commit;
import static db.JdbcUtill.getConnection;
import static db.JdbcUtill.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardDTO;

public class BoardReplyProService {
	public boolean replyBoard(BoardDTO dto) {
		boolean isReplySuccess = false;
		
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
		
		
		int insertCount = dao.insertReplyBoard(dto); 
		
	
		if(insertCount > 0) {
			commit(con);
	
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isReplySuccess;
	}

}
