package svc;

import static db.JdbcUtill.close;
import static db.JdbcUtill.commit;
import static db.JdbcUtill.getConnection;
import static db.JdbcUtill.rollback;

import java.sql.Connection;


import dao.MemberDAO;
import vo.MemberDTO;

public class MemberJoinProService {
	public boolean joinMember(MemberDTO dto) {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		boolean isJoinSuccess = false;
		
		int insertCount = dao.insertMember(dto);

		if (insertCount > 0) {
			commit(con);
			isJoinSuccess = true;
		} else {
			rollback(con);

		}

		close(con);
		return isJoinSuccess;
	}

}
