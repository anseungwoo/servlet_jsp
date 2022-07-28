package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtill.close;
import static jsp15_java_mail2.JdbcUtill.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
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
