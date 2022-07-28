package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.*;

import java.sql.Connection;

public class MemberJoinProService {

	public boolean joinMember(MemberDTO member) {
		boolean isJoinSuccess = false;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		// (MemberDAO - insertMember() 메서드 호출 - 파라미터 동일, 리턴타입 : int(insertCount)
		// => Service 클래스에서 수행 결과(int)를 사용하여 commit, rollback 판별
		int insertCount = dao.insertMember(member);
		
		if(insertCount > 0) {
			commit(con);
			isJoinSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isJoinSuccess;
	}

}












