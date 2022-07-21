package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Test8_1DAO {
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

	public int insert(Test8_1DTO test8_1DTO) throws Exception {
		DBconnect();

		// 3단계. SQL 작성 및 전달
		String sql = "INSERT INTO test8_1 VALUES (?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, test8_1DTO.getName());
		pstmt.setInt(2, test8_1DTO.getAge());
		pstmt.setString(3, test8_1DTO.getGender());
		pstmt.setString(4, test8_1DTO.getHobby());

		// 4단계. SQL 구문 실행 및 결과 처리
		int insertCount = pstmt.executeUpdate();
		System.out.println("INSERT 작업 성공! - " + insertCount + "개 레코드");

		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)

		pstmt.close();
		con.close();
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴
		return insertCount;
	}

	public Test8_1DTO selectInfo(String name) throws Exception {
		Test8_1DTO dto = null;
		DBconnect();

		// 3단계. SQL 구문 작성 및 전달
		String sql = "SELECT * FROM test8_1 WHERE name=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);

		// 4단계. SQL 구문 실행 및 결과처리
		rs = pstmt.executeQuery();
		System.out.println("SELECT 작업 성공");

		while (rs.next()) {
			dto = new Test8_1DTO();
			dto.setAge(rs.getInt("age"));
			dto.setName(rs.getString("name"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));

		}

		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)
		rs.close();
		pstmt.close();
		con.close();
		return dto;
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴

	}

	
	public Test8_1DTO[] selectList() throws Exception {
		Test8_1DTO[] arrDto=null;
		Test8_1DTO dto = null;
		DBconnect();

		String sql = "SELECT COUNT(*) FROM test8_1";
		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();
		System.out.println("SELECT 작업 성공");
	
		while (rs.next()) {
		arrDto = new Test8_1DTO[rs.getInt(1)];
		System.out.println(rs.getInt(1));
		}
		sql = "SELECT * FROM test8_1";
		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();
		System.out.println("SELECT 작업 성공");
		int i=0;
		while (rs.next()) {
			dto = new Test8_1DTO();
			dto.setAge(rs.getInt("age"));
			dto.setName(rs.getString("name"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
			arrDto[i]=dto;
			i++;
		}
		i=0;
		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)
		rs.close();
		pstmt.close();
		con.close();
		return arrDto;
		// SQL 구문(INSERT 작업) 실행 결과를 저장한 insertCount 변수값 리턴

	}
	public ArrayList<Test8_1DTO> selectList2() throws Exception {
		//DB에 저장된 내용 전체를 저장하기위한 리스트 생성
		ArrayList<Test8_1DTO> dtolist = new ArrayList<Test8_1DTO>();
		Test8_1DTO dto = null;
		//드라이버 DB연결
		DBconnect();

		//sql문 작성
		String sql = "SELECT * FROM test8_1";
		//sql문 탐색
		pstmt = con.prepareStatement(sql);
		//sql문 결과 저장
		rs = pstmt.executeQuery();
		System.out.println("SELECT 작업 성공");
		//결과 내용을 저장
		while (rs.next()) {
			dto = new Test8_1DTO();
			dto.setAge(rs.getInt("age"));
			dto.setName(rs.getString("name"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
			dtolist.add(dto);
		}

		// 사용된 자원 모두 반환(생성된 객체의 역순으로 반환)
		rs.close();
		pstmt.close();
		con.close();
		// 내용을 저장한 리스트를 반환
		return dtolist;
		

	}
}
