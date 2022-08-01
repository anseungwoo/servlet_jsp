package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthInfoDAO {
	private static AuthInfoDAO instance = new AuthInfoDAO();
	// 2. 생성자 정의
	private AuthInfoDAO() {}
	// 3. Getter 정의(자동 생성)
	public static AuthInfoDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------------------------------------------
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 관리하기 위해
	// Connection 타입 멤버변수와 Setter 메서드 정의
	private Connection con;
	public void setConnection(Connection con) {
		this.con = con;
	}
	public boolean isAuthentication(AuthInfoDTO authInfo) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		boolean isAuthenticationSuccess =false;
		
		try {
			String sql = "SELECT * FROM auth_info WHERE id=? AND auth_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authInfo.getId());
			pstmt.setString(2, authInfo.getAuthCode());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql="UPDATE auth_member SET auth_status='Y' WHERE id=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, authInfo.getId());
				int updateCount=pstmt2.executeUpdate();
				sql="DELETE FROM auth_info WHERE id=?";
				pstmt3 = con.prepareStatement(sql);
				pstmt3.setString(1, authInfo.getId());
				int deleteCount=pstmt3.executeUpdate();
				
				if(updateCount>0 && deleteCount>0) {
					isAuthenticationSuccess = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(pstmt3);
			
		}
		return isAuthenticationSuccess;
	}
}
