package svc;

import static db.JdbcUtill.close;
import static db.JdbcUtill.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberDTO;

public class MemberListService {
	public ArrayList<MemberDTO> getMemberList() {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		ArrayList<MemberDTO> list= dao.selectMemberList();
		
		close(con);
		return list;
	}
}
