package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDAO {
	// testForm.jsp 페이지에서 전달받은 데이터를 저장한 TestDTO 객체를 전달받아
	// 데이터를 추가(INSERT)하는 insert() 메서드 정의
	// => 파라미터 : testDTO 객채(dto)
	// => 리턴타입 : int(insertCount)
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/study_jsp2";
	private String user = "root";
	private String password = "1234";
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void DBconnect() throws Exception {
		Class.forName(driver);
		System.out.println("드라이버 로드 성공!");

		// 2단계. DB 연결
		con = DriverManager.getConnection(url, user, password);
		System.out.println("DB 연결 성공!");
	}

	public int insert(TestDTO testDTO) throws Exception {
		DBconnect();
		// 3단계. SQL 작성 및 전달
		String sql = "INSERT INTO test3 VALUES (?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, testDTO.getIdx());
		pstmt.setString(2, testDTO.getName());

		// 4단계. SQL 구문 실행 및 결과 처리
		int insertCount = pstmt.executeUpdate();
		System.out.println("INSERT 작업 성공! - " + insertCount + "개 레코드");

		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)

		pstmt.close();
		con.close();
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴
		return insertCount;
	}

	public TestDTO selectInfo(int idx) throws Exception {
		TestDTO dto =null;
		DBconnect();
		// 3단계. SQL 구문 작성 및 전달
		String sql = "SELECT * FROM test3 WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		// 4단계. SQL 구문 실행 및 결과처리
		rs = pstmt.executeQuery();
		System.out.println("SELECT 작업 성공");

		while (rs.next()) {
			System.out.println("번호 : "+rs.getInt("idx"));
			System.out.println("이름 : "+rs.getString("name"));
			dto =new TestDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));

		}
		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)
		rs.close();
		pstmt.close();
		con.close();
		return dto;
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴
	
	}

}
