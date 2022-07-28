package jsp9_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Test8_1DAO {
	
	// 회원 정보를 저장하는 insert() 메서드 정의
	// => 파라미터 : Test8_1DTO 객체(dto)   리턴타입 : int(insertCount)
	public int insert(Test8_1DTO dto) throws Exception {
		int insertCount = 0; // 실행 결과를 저장할 변수 선언
		
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
		// => test8_1 테이블의 레코드 추가(추가할 데이터는 Test8_1DTO 객체에 저장되어 있음)
		String sql = "INSERT INTO test8_1 VALUES (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getAge());
		pstmt.setString(3, dto.getGender());
		pstmt.setString(4, dto.getHobby());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		insertCount = pstmt.executeUpdate();
				
		// 자원 반환
		pstmt.close();
		con.close();
		
		return insertCount;
	}
	
	// 회원 상세 정보 조회 selectInfo() 메서드 정의
	// => 파라미터 : 이름(name), 리턴타입 : Test8_1DTO(dto)
	public Test8_1DTO selectInfo(String name) throws Exception {
		Test8_1DTO dto = null; // 조회된 회원 정보를 저장하는 DTO 타입 변수 선언
		
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
		// => name 컬럼이 일치하는 레코드 정보 조회
		String sql = "SELECT * FROM test8_1 WHERE name=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
//			System.out.println(rs.getString("name"));
//			System.out.println(rs.getInt("age"));
//			System.out.println(rs.getString("gender"));
//			System.out.println(rs.getString("hobby"));
			
			// DTO 인스턴스 생성 후 조회된 데이터를 저장
			dto = new Test8_1DTO();
			dto.setName(rs.getString("name"));
			dto.setAge(rs.getInt("age"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
		}
		
		// 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		
		// 1명의 상세 정보가 저장된 Test8_1DTO 타입 객체 리턴
		return dto; // test3_selectInfo.jsp 로 리턴됨
	}
	
	
	// 회원 목록을 조회하는 selectList() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : Test8_1DTO 배열
	public Test8_1DTO[] selectList() throws Exception {
		Test8_1DTO[] arrDto = null;
		
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
		// => test8_1 테이블의 모든 레코드 갯수 조회(COUNT() 함수 활용)
		// < 기본 문법 > SELECT COUNT(컬럼명) FROM 테이블명
		String sql = "SELECT COUNT(*) FROM test8_1";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int count = rs.getInt("COUNT(*)"); // rs.getInt(1);
			System.out.println("레코드 수 : " + count);
			
			// Test8_1DTO 타입 배열 생성 => 배열 크기는 조회된 레코드 수 활용
			arrDto = new Test8_1DTO[count];
		}
		
		// ----------------------------------------------------
		// 3단계. SQL 구문 작성 및 전달
		// => test8_1 테이블의 모든 레코드 조회 후 출력
		String sql2 = "SELECT * FROM test8_1";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs2 = pstmt2.executeQuery();
		
		// 배열 인덱스로 사용될 정수값을 저장하는 변수 선언
		int index = 0; // 초기값 0으로 설정
		
		while(rs2.next()) {
//			System.out.println(rs2.getString("name"));
//			System.out.println(rs2.getInt("age"));
//			System.out.println(rs2.getString("gender"));
//			System.out.println(rs2.getString("hobby"));
//			System.out.println("---------------------");
			
			// DTO 인스턴스 생성 후 조회된 데이터를 저장
			Test8_1DTO dto = new Test8_1DTO();
			dto.setName(rs2.getString("name"));
			dto.setAge(rs2.getInt("age"));
			dto.setGender(rs2.getString("gender"));
			dto.setHobby(rs2.getString("hobby"));
			
			// 1개 레코드가 저장된 DTO 객체를 여러개의 DTO 객체를 저장하는 배열에 저장
			// => 이 때, 배열 인덱스는 while 문 바깥에서 선언한 index 변수값 활용
			arrDto[index] = dto;
			
			// 배열에 데이터 저장 후 인덱스 값(index) 1 증가시킴
			index++;
		}
		
		// 자원 반환
		rs.close(); 
		rs2.close();
		pstmt.close();
		pstmt2.close();
		con.close();
		
		// 조회된 회원 목록을 저장하는 객체 리턴
		return arrDto;
	}
	
	// 회원 목록을 조회하는 selectList2() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : ArrayList(list)
	public ArrayList selectList2() throws Exception {
		ArrayList list = null;
		
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
		// => test8_1 테이블의 모든 레코드 조회
		String sql = "SELECT * FROM test8_1";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		// 전체 레코드를 저장할 ArrayList 객체 생성
		list = new ArrayList();
		
		while(rs.next()) {
			// DTO 인스턴스 생성 후 조회된 데이터 중 1개 레코드를 저장
			Test8_1DTO dto = new Test8_1DTO();
			dto.setName(rs.getString("name"));
			dto.setAge(rs.getInt("age"));
			dto.setGender(rs.getString("gender"));
			dto.setHobby(rs.getString("hobby"));
			
			// 1개 레코드를 전체 레코드 저장하는 ArrayList 객체에 추가
			// => ArrayList 객체의 add() 메서드 호출
			list.add(dto); // 배열에 저장하는 arrDto[i] = dto; 코드와 동작 원리는 거의 동일함
			// => 배열과 달리 데이터 갯수에 따라 크기가 자동으로 증가하며
			//    저장 시 인덱스를 지정할 필요도 없음
			
			// 만약, ArrayList 객체에 저장된 데이터 출력할 경우 변수명만 사용 가능
//			System.out.println(list); // Test8_1DTO 객체가 7개 보이면 성공
		}
		
		// 전체 레코드가 저장된 ArrayList 객체 리턴
		return list;
	}
	
}















