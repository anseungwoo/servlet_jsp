package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDAO;
import static db.JdbcUtill.*;
import vo.BoardDTO;

public class BoardWriteProService {
	public boolean registBoard(BoardDTO dto) {
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);

		int insertCount = dao.insertBoard(dto);

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);

		}

		close(con);

		return isWriteSuccess;
	}
}
