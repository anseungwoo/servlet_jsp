package jsp15_java_mail2;



import static jsp15_java_mail2.JdbcUtil.close;
import static jsp15_java_mail2.JdbcUtil.getConnection;

import java.sql.Connection;
public class MemberLoginProService {

	public boolean loginMember(MemberDTO member) {
		boolean isLoginSuccess = false;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		isLoginSuccess = dao.selectMember(member);
		
		close(con);
		
		return isLoginSuccess;
	}

}









