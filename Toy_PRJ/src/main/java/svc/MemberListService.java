package svc;

import static db.JdbcUtill.getConnection;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberListService {
	public void getMemberList() {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
	}
}
