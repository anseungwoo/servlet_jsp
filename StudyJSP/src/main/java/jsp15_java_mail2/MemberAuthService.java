package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.*;
import static jsp15_java_mail2.JdbcUtil.getConnection;

import java.sql.Connection;

public class MemberAuthService {

	public boolean isAuthentication(AuthInfoDTO authInfo) {
		boolean isAuthenticationSuccess =false;
		
		Connection con = getConnection();
		AuthInfoDAO dao = AuthInfoDAO.getInstance();
		dao.setConnection(con);
		
		isAuthenticationSuccess=dao.isAuthentication(authInfo);
		
		if (isAuthenticationSuccess) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
	
		return isAuthenticationSuccess;
	}

}
