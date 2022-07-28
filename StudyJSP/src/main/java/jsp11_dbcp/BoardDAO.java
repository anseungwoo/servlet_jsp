package jsp11_dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	// 게시물 등록 작업 수행하는 insert() 메서드 정의
	// => 파라미터 : BoardDTO 객체,  리턴타입 : int(insertCount)
	// => 단, SQL 구문 작성 시 idx 값은 null, date 값은 now() 함수, readcount 값은 0 지정
	public int insert(BoardDTO dto) throws Exception {
		int insertCount = 0;
		
		// JdbcUtil 클래스의 getConnection() 메서드를 호출하여
		// 1단계&2단계 수행 후 Connection 객체 리턴받기
//		JdbcUtil jdbcUtil = new JdbcUtil();
//		Connection con = JdbcUtil.getConnection();
		
		// 1단계 & 2단계
		// JdbcUtil 클래스의 static 메서드로 선언된 getConnection() 메서드 호출
		Connection con = JdbcUtil.getConnection();

		// 3단계. SQL 구문 작성 및 전달
		// => BoardDTO 객체에 저장된 데이터 추가
		String sql = "INSERT INTO board VALUES (null,?,?,?,?,now(),0)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getSubject());
		pstmt.setString(4, dto.getContent());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		insertCount = pstmt.executeUpdate();
		
		// 자원 반환
//		pstmt.close();
//		con.close();
		
		// JdbcUtil 클래스의 static 메서드 close() 를 호출하여 각 자원 반환 => static 메서드
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		return insertCount;
	}
	
	// 전체 게시물 목록 갯수를 조회하는 selectListCount() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : int(listCount)
	public int selectListCount() throws Exception {
		int listCount = 0;
		
		// 1단계 & 2단계
		// JdbcUtil 클래스의 static 메서드로 선언된 getConnection() 메서드 호출
		Connection con = JdbcUtil.getConnection();
		
		// 3단계. SQL 구문 작성 및 전달
		String sql = "SELECT COUNT(*) FROM board";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			// 컬럼명 COUNT(*) 또는 인덱스번호 1 사용하여 게시물 수 가져오기
			listCount = rs.getInt(1);
//			listCount = rs.getInt("COUNT(*)");
		}
		
		// 자원 반환
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		return listCount;
	}
	
	// 전체 게시물 목록을 조회하는 selectList() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : ArrayList(내부에 BoardDTO 객체가 들어있음)
//	public ArrayList selectList() throws Exception {
//		ArrayList list = new ArrayList();
//		
//		// 1단계 & 2단계
//		// JdbcUtil 클래스의 static 메서드로 선언된 getConnection() 메서드 호출
//		Connection con = JdbcUtil.getConnection();
//
//		// 3단계. SQL 구문 작성 및 전달
//		// => board 테이블의 모든 레코드 조회
//		// => 단, 게시물을 번호 순으로 내림차순 정렬(ORDER BY 컬럼명 정렬방법)
//		//    또한, 게시물 조회 갯수를 10개로 제한(LIMIT 갯수)
//		String sql = "SELECT * FROM board ORDER BY idx DESC LIMIT 10";
//		PreparedStatement pstmt = con.prepareStatement(sql);
//		
//		// 4단계. SQL 구문 실행 및 결과 처리
//		ResultSet rs = pstmt.executeQuery();
//		
//		// 전체 게시물 목록을 저장할 ArrayList 객체 생성
//		list = new ArrayList();
//		
//		// ResultSet 객체에서 차례대로 레코드에 접근하여 데이터 저장
//		while(rs.next()) {
//			// 1개 게시물 정보를 저장할 BoardDTO 객체 생성 후 1개 레코드 값 저장
//			BoardDTO dto = new BoardDTO();
//			dto.setIdx(rs.getInt("idx"));
//			dto.setName(rs.getString("name"));
////			dto.setPasswd(rs.getString("passwd"));
//			dto.setSubject(rs.getString("subject"));
////			dto.setContent(rs.getString("content"));
//			dto.setDate(rs.getDate("date"));
//			dto.setReadcount(rs.getInt("readcount"));
//			
//			// 전체 게시물을 저장하는 ArrayList 객체에 1개 게시물을 저장한 BoardDTO 객체 추가
//			list.add(dto);
//		}
//		
//		// 자원 반환
//		// JdbcUtil 클래스의 static 메서드 close() 를 호출하여 각 자원 반환 => static 메서드
//		JdbcUtil.close(rs);
//		JdbcUtil.close(pstmt);
//		JdbcUtil.close(con);
//		
//		// 전체 게시물 정보가 저장되어 있는 ArrayList 객체 리턴
//		return list;
//	}
	
	// 게시물 목록을 조회하는 selectList() 메서드 정의(페이징 처리 기능 추가)
	// => 파라미터 : 현재 페이지번호(pageNum), 페이지 당 게시물 수(listLimit)
	public ArrayList selectList(int pageNum, int listLimit) throws Exception {
		ArrayList list = new ArrayList();
		
		// 조회 시 시작 게시물 번호(LIMIT 절에 사용할 시작 레코드(행) 번호) 계산
		// => 공식 : (현재페이지번호 - 1) * 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit;
		
		// 1단계 & 2단계
		// JdbcUtil 클래스의 static 메서드로 선언된 getConnection() 메서드 호출
		Connection con = JdbcUtil.getConnection();

		// 3단계. SQL 구문 작성 및 전달
		// => board 테이블의 모든 레코드 조회
		// => 단, 게시물을 번호 순으로 내림차순 정렬(ORDER BY 컬럼명 정렬방법)
		//    또한, 게시물 조회 갯수를 시작행부터 10개로 제한(LIMIT 시작행번호,갯수)
		String sql = "SELECT * FROM board ORDER BY idx DESC LIMIT ?,?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, listLimit);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		// 전체 게시물 목록을 저장할 ArrayList 객체 생성
		list = new ArrayList();
		
		// ResultSet 객체에서 차례대로 레코드에 접근하여 데이터 저장
		while(rs.next()) {
			// 1개 게시물 정보를 저장할 BoardDTO 객체 생성 후 1개 레코드 값 저장
			BoardDTO dto = new BoardDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
//			dto.setPasswd(rs.getString("passwd"));
			dto.setSubject(rs.getString("subject"));
//			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
			
			// 전체 게시물을 저장하는 ArrayList 객체에 1개 게시물을 저장한 BoardDTO 객체 추가
			list.add(dto);
		}
		
		// 자원 반환
		// JdbcUtil 클래스의 static 메서드 close() 를 호출하여 각 자원 반환 => static 메서드
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
		
		// 전체 게시물 정보가 저장되어 있는 ArrayList 객체 리턴
		return list;
	}
	
	
	
}













