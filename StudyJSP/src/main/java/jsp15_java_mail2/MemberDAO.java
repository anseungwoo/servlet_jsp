package jsp15_java_mail2;

import static jsp15_java_mail2.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	// 1. 멤버변수 선언 및 인스턴스 생성
	private static MemberDAO instance = new MemberDAO();
	// 2. 생성자 정의
	private MemberDAO() {}
	// 3. Getter 정의(자동 생성)
	public static MemberDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------------------------------------------
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 관리하기 위해
	// Connection 타입 멤버변수와 Setter 메서드 정의
	private Connection con;
	public void setConnection(Connection con) {
		this.con = con;
	}
	// ----------------------------------------------------------------------------------------

	// 회원 추가 작업을 수행하는 insertMember() 메서드 정의
	// => 파라미터 : MemberDTO, 리턴타입 : int(insertCount)
	public int insertMember(MemberDTO dto) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			String sql = "INSERT INTO auth_member VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, "N"); // 인증 여부 기본값 "N" 설정
			
			// 4단계. SQL 구문 실행 및 결과 처리
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 로그인 작업 수행하는 checkUser() 메서드 정의
	// => 파라미터 : MemberDTO 객체, 리턴타입 : boolean(isLoginSuccess)
	public boolean checkUser(MemberDTO dto) throws Exception {
		boolean isLoginSuccess = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			// => 전달받은 아이디, 패스워드를 사용하여 일치하는 레코드 조회
			String sql = "SELECT * FROM auth_member WHERE id=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// ResultSet 객체의 다음 레코드가 존재할 경우 = 로그인 성공
			if(rs.next()) {
				// 조회 성공 시(= 로그인 성공) isLoginSuccess 값을 true 로 변경
				isLoginSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}
		
		return isLoginSuccess;
	}
	
	// 인증코드 등록 작업 수행
	// => 파라미터 : 아이디, 인증코드   리턴타입 : int(registCount)
	public int registAuthCode(String id, String authCode) {
		int registCount = 0;
		
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		
		try {
			// 전달받은 ID 에 대한 기존 인증코드가 존재하는지 확인 후
			// 만약, 기존 인증코드가 존재하면 새 인증코드로 덮어쓰고(UPDATE),
			// 아니면, 아이디와 인증코드를 새로 등록(INSERT)
			String sql = "SELECT auth_code FROM auth_info WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 기존 인증코드가 이미 존재하는 경우
				// UPDATE 구문을 사용하여 인증코드 갱신(새로운 인증코드로 덮어씀)
				sql = "UPDATE auth_info SET auth_code=? WHERE id=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, authCode);
				pstmt2.setString(2, id);
				registCount = pstmt2.executeUpdate();
				System.out.println("인증코드 갱신 성공!");
			} else { // 기존 인증코드가 존재하지 않는 경우
				// INSERT 구문을 사용하여 아이디와 인증코드 추가
				sql = "INSERT INTO auth_info VALUES (?,?)";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, id);
				pstmt2.setString(2, authCode);
				registCount = pstmt2.executeUpdate();
				System.out.println("인증코드 등록 성공!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
		}
		
		return registCount;
	}
	public boolean selectDuplicateId(String id) {
		boolean isDuplicate = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디가 이미 존재할 경우
				isDuplicate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectDuplicateId() 메서드 오류 : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isDuplicate;
	}
	public boolean selectMember(MemberDTO member) {
		boolean isLoginSuccess = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLoginSuccess =  true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO - selectMember() 메서드 오류 : " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return isLoginSuccess;
	}
}














