package jsp10_board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO_backup {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	JdbcUtill jdbcUtill=new JdbcUtill();
	

	// 게시물 등록 작업 수행하는 insert() 메서드 정의
	// => 파라미터 : BoardDTO 객체,  리턴타입 : int(insertCount)
	// => 단, SQL 구문 작성 시 idx 값은 null, date 값은 now() 함수, readcount 값은 0 지정
	public int insert(BoardDTO dto) throws Exception {
		int insertCount = 0;
		con=jdbcUtill.getConnection();

		// 3단계. SQL 구문 작성 및 전달
		// => BoardDTO 객체에 저장된 데이터 추가
		String sql = "INSERT INTO board VALUES (null,?,?,?,?,now(),0)";
	    pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getSubject());
		pstmt.setString(4, dto.getContent());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		insertCount = pstmt.executeUpdate();
		// 자원 반환
		jdbcUtill.close(con);
		jdbcUtill.close(pstmt);
		return insertCount;
	}
	
	// 전체 게시물 목록을 조회하는 selectList() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : ArrayList(내부에 BoardDTO 객체가 들어있음)
	public ArrayList selectList() throws Exception {
		ArrayList list = new ArrayList();
		
		con=jdbcUtill.getConnection();
		// 3단계. SQL 구문 작성 및 전달
		// => board 테이블의 모든 레코드 조회
		// => 단, 게시물을 번호 순으로 내림차순 정렬(ORDER BY 컬럼명 정렬방법)
		//    또한, 게시물 조회 갯수를 10개로 제한(LIMIT 갯수)
		String sql = "SELECT * FROM board ORDER BY idx DESC LIMIT 10";
		pstmt = con.prepareStatement(sql);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		rs = pstmt.executeQuery();
		
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
		rs.close();
		pstmt.close();
		con.close();
		
		// 전체 게시물 정보가 저장되어 있는 ArrayList 객체 리턴
		return list;
	}
	
	
	// 글 상세정보를 조회하는 selectDetail() 메서드 정의
	// => 파라미터 : 글번호(idx), 리턴타입 : BoardDTO(dto)
	public BoardDTO selectDetail(int idx) throws Exception {
		BoardDTO dto = null;
		con=jdbcUtill.getConnection();

		
		// ------------------------------------------------------------------------
		// 3단계. SQL 구문 작성 및 전달(옵션)
		// => board 테이블의 번호(idx)가 일치하는 레코드의 조회수(readcount) 1 증가
		//    (UPDATE 테이블명 SET 컬럼명=컬럼명+1 WHERE...)
//		String sql2 = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
//		PreparedStatement pstmt2 = con.prepareStatement(sql2);
//		pstmt2.setInt(1, idx);
//		pstmt2.executeUpdate(); // 리턴값 체크 불필요
		// => 게시물 상세 정보 조회 작업 수행 시 조회수 증가 작업을 수행할 경우
		//    게시물 수정 작업에서 상세 조회 기능을 호출할 때도 조회수가 증가하므로
		//    가급적 별도의 메서드로 분리하는 것이 좋음
		// ------------------------------------------------------------------------		
		
		// --------------------------------------------------
		// 3단계. SQL 구문 작성 및 전달
		// => board 테이블의 번호(idx)가 일치하는 레코드 조회
		String sql = "SELECT * FROM board WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dto = new BoardDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
//			dto.setPasswd(rs.getString("passwd")); // 원본 패스워드는 조회 대상에 포함 X(전송 시 노출되기 때문)
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setReadcount(rs.getInt("readcount"));
		}
		
		// 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		
		// 전체 게시물 정보가 저장되어 있는 ArrayList 객체 리턴
		return dto;
	}
	
	// 조회수 증가 작업 수행을 위해 updateReadcount() 메서드 정의
	// =>  파라미터 : 글번호(idx), 리턴타입 : void
	public void updateReadcount(int idx) throws Exception {
		// DB 작업에 필요한 문자열 선언
		con=jdbcUtill.getConnection();

		// 3단계. SQL 구문 작성 및 전달
		String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		pstmt.executeUpdate();
		
		// 자원 반환
		pstmt.close();
		con.close();
	}
	
	// 게시물 수정 작업 처리하는 update() 메서드 정의
	// => 파라미터 : BoardDTO 객체   리턴타입 : int(updateCount)
	public int update(BoardDTO dto) throws Exception {
		int updateCount = 0;
		con=jdbcUtill.getConnection();
		// 3단계. SQL 구문 작성 및 전달
		// BoardDTO 객체에 저장된 idx 값과 일치하는 레코드의 패스워드를 조회
		// => 패스워드 일치 여부 검사(BoardDTO 객체에 저장된 passwd 값 활용)
		String sql = "SELECT passwd FROM board WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getIdx());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		// => 조회된 패스워드가 존재할 경우 BoardDTO 객체의 패스워드와 비교 작업 수행
		rs = pstmt.executeQuery();
		if(rs.next()) {
			if(dto.getPasswd().equals(rs.getString("passwd"))) { // 패스워드가 일치할 경우
				// 3단계. SQL 구문 작성 및 전달
				// => UPDATE 구문을 사용하여 글번호(idx)와 일치하는 레코드의 
				//    작성자, 제목, 내용을 수정
				sql = "UPDATE board SET name=?,subject=?,content=? WHERE idx=?";
				PreparedStatement pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, dto.getName());
				pstmt2.setString(2, dto.getSubject());
				pstmt2.setString(3, dto.getContent());
				pstmt2.setInt(4, dto.getIdx());
				
				// 4단계. SQL 구문 실행 및 결과 처리
				// => 수정 작업 완료 결과를 updateCount 변수에 저장
				updateCount = pstmt2.executeUpdate();
				
				// 자원 반환
				pstmt2.close();
			} 
		}
		
		// 자원 반환
		rs.close();
		pstmt.close();
		con.close();
		
		return updateCount;
	}
	
	// 게시물 삭제 작업을 수행할 delete() 메서드 정의
	// => 파라미터 : BoardDTO 객체   리턴타입 : int(deleteCount)
	public int delete(BoardDTO dto) throws Exception {
		int deleteCount = 0;
		con=jdbcUtill.getConnection();

		// 3단계. SQL 구문 작성 및 전달
		// 번호(idx)가 일치하고, 패스워드(passwd)도 일치하는 레코드 삭제
		String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getIdx());
		pstmt.setString(2, dto.getPasswd());
		
		// 4단계. SQL 구문 실행 및 결과 처리
		deleteCount = pstmt.executeUpdate();
		
		// 자원반환
		pstmt.close();
		con.close();
		
		return deleteCount;
	}
	
}













