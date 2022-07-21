package jsp10_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	// 회원 추가 작업을 수행하는 insertMember() 메서드 정의
	// => 파라미터 : MemberDTO, 리턴타입 : int(insertCount)
	public int insertMember(MemberDTO dto) throws Exception {
		int insertCount = 0;
		
		// DB 작업에 필요한 문자열 선언
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";

		// 1단계. 드라이버 로드
		Class.forName(driver);
		System.out.println("드라이버 로드 성공!");

		// 2단계. DB 연결
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("DB 연결 성공!");

		// 3단계. SQL 구문 작성 및 전달
		String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getId());
		pstmt.setString(3, dto.getPasswd());
		pstmt.setString(4, dto.getJumin());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getJob());
		pstmt.setString(7, dto.getGender());
		pstmt.setString(8, dto.getContent());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		insertCount = pstmt.executeUpdate();
		
		// 자원 반환
		pstmt.close();
		con.close();
		
		return insertCount;
	}
	
	// 로그인 작업 수행하는 checkUser() 메서드 정의
	// => 파라미터 : MemberDTO 객체, 리턴타입 : boolean(isLoginSuccess)
	public boolean checkUser(MemberDTO dto) throws Exception {
		boolean isLoginSuccess = false;
		
		// DB 작업에 필요한 문자열 선언
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp2";
		String user = "root";
		String password = "1234";

		// 1단계. 드라이버 로드
		Class.forName(driver);
		System.out.println("드라이버 로드 성공!");

		// 2단계. DB 연결
		Connection con = DriverManager.getConnection(url, user, password);
		System.out.println("DB 연결 성공!");

		// 3단계. SQL 구문 작성 및 전달
		// => 전달받은 아이디, 패스워드를 사용하여 일치하는 레코드 조회
		String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		// ResultSet 객체의 다음 레코드가 존재할 경우 = 로그인 성공
		if(rs.next()) {
			// 조회 성공 시(= 로그인 성공) isLoginSuccess 값을 true 로 변경
			isLoginSuccess = true;
		}
		
		// 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		
		return isLoginSuccess;
	}
	
}














