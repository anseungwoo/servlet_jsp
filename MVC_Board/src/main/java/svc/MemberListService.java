package svc;

import static db.JdbcUtill.getConnection;

import java.sql.Connection;

import dao.BoardDAO;

public class MemberListService {
	public void getMemberList() {
		Connection con = getConnection();
		BoardDAO dao = BoardDAO.getInstance();
		dao.setConnection(con);
	}
}
