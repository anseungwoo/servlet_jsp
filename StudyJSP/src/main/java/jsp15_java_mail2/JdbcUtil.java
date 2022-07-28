package jsp15_java_mail2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 데이터베이스 접속 관련 처리를 수행하는 JdbcUtil 클래스 정의
// => 데이터베이스 접속 및 자원 반환(해제) 등의 공통적인 작업 수행
// => 인스턴스 생성 없이도 모든 메서드를 클래스명만으로 접근 가능하도록 static 메서드로 정의
public class JdbcUtil {
	// 1. 데이터베이스 접속을 수행하는 getConnection() 메서드 정의
	// => 데이터베이스 작업 1단계와 2단계를 수행하는 메서드
	// => DB 접속 수행 성공 시 리턴되는 java.sql.Connection 객체를 리턴
	public static Connection getConnection() {
		// 데이터베이스 연결 객체를 저장할 Connection 타입 변수 선언
		Connection con = null;
		
		try {
			// DB 작업에 필요한 문자열 선언
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp2";
			String user = "root";
			String password = "1234";

			// 1단계. 드라이버 로드
			Class.forName(driver);
			System.out.println("드라이버 로드 성공!");

			// 2단계. DB 연결
			con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공!");
			
			con.setAutoCommit(false); // 오토커밋 해제
		} catch (ClassNotFoundException e) {
			// 1단계 작업(드라이버 로드) 과정 실패 시 수행할 코드를 기술하는 블록
			e.printStackTrace();
			System.out.println("드라이버 로드 실패!");
		} catch (SQLException e) {
			// 2단계 작업(DB 연결) 과정 실패 시 수행할 코드를 기술하는 블록
			e.printStackTrace();
			System.out.println("DB 연결 실패!");
		}
		
		return con;
	}
	
	// 2. 각종 DB 관련 자원을 반환하는 close() 메서드 정의 => 메서드 오버로딩 활용
	// => Connection, PreparedStatement, ResultSet
	public static void close(Connection con) { // Connection 반환
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) { // PreparedStatement 반환
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) { // ResultSet 반환
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}















