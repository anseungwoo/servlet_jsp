package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestDAO {
	
	// testForm.jsp 페이지에서 전달받은 데이터를 저장한 TestDTO 객체를 전달받아
	// 데이터를 추가(INSERT)하는 insert() 메서드 정의
	// => 파라미터 : TestDTO 객체(dto), 리턴타입 : int(insertCount)
	public int insert(TestDTO dto) throws Exception {
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
		
		// 3단계. SQL 작성 및 전달
		String sql = "INSERT INTO test3 VALUES (?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		// PreparedStatement 객체의 setXXX() 메서드로 ? 파라미터 채우기
		// => 사용될 데이터는 TestDTO 객체의 getXXX() 메서드로 가져오기
		pstmt.setInt(1, dto.getIdx());
		pstmt.setString(2, dto.getName());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		int insertCount = pstmt.executeUpdate();
		System.out.println("INSERT 작업 성공! - " + insertCount + "개 레코드");
		
		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)
		pstmt.close();
		con.close();
		
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴
		return insertCount;
		
	}
	
	// 회원 1명의 정보를 조회하는 selectInfo() 메서드 정의
	// => 파라미터 : 번호(idx)
	// => 리턴타입 : 1개의 레코드(한 명의 회원 정보) = TestDTO 객체(dto)
	public TestDTO selectInfo(int idx) throws Exception {
//		System.out.println("selectInfo() 메서드 호출됨");
		
		// 리턴할 데이터를 저장할 TestDTO 타입 변수 선언
		TestDTO dto = null; // 기본값으로 null 값 초기화
		
		// test3 테이블에서 idx 값이 일치하는 레코드를 조회하여 바로 출력하기
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
		// => test3 테이블에서 idx 가 일치하는 레코드 검색
		String sql = "SELECT * FROM test3 WHERE idx=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			// 조회된 레코드 데이터 출력
//			System.out.println("번호 : " + rs.getInt("idx"));
//			System.out.println("이름 : " + rs.getString("name"));
			
			// 1개 레코드를 저장할 TestDTO 객체 생성(변수는 이미 선언되어 있음)
			dto = new TestDTO();
			
			// 조회된 1개 레코드 정보를 TestDTO 객체에 저장
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
		}
		
		// 작업 완료 후 사용이 끝난 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		
		// 1개 레코드가 저장된 TestDTO 객체 리턴
		return dto;
	}
	
	
}
















