package jsp15_java_mail2;



import static jsp15_java_mail2.JdbcUtil.close;
import static jsp15_java_mail2.JdbcUtil.getConnection;

import java.sql.Connection;
public class MemberLoginProService {

	

	public boolean isAuthenticatedUser(MemberDTO member) {
		boolean isAuthenticatedUserSuccess = false;
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		isAuthenticatedUserSuccess=dao.isAuthenticatedUser(member);
		
		close(con);
		return isAuthenticatedUserSuccess;
	}
	public boolean loginMember(MemberDTO member) {
		boolean isLoginSuccess = false;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		isLoginSuccess = dao.checkUser(member);
		
		close(con);
		
		return isLoginSuccess;
	}

}









