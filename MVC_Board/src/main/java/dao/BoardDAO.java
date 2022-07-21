package dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtill;

import static db.JdbcUtill.*;
import vo.BoardDTO;



public class BoardDAO {

	
	private static BoardDAO instance =new BoardDAO();
	private static Connection con;
	public void setConnection(Connection con) {
		this.con=con; 
	}
	private BoardDAO() {}
	public static BoardDAO getInstance() {
		return instance;
	}

	public int insertBoard(BoardDTO dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("insertBoard");
		int insertCount = 0;
		String sql = "SELECT MAX(board_num) FROM board";
		int num = 1;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			close(pstmt);
			
			sql = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getBoard_name());
			pstmt.setString(3, dto.getBoard_pass()); 
			pstmt.setString(4, dto.getBoard_subject());
			pstmt.setString(5, dto.getBoard_content());
			pstmt.setString(6, dto.getBoard_realFile());
			pstmt.setString(7, dto.getBoard_file());
			pstmt.setInt(8, num);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return insertCount;
	} 
	
	
	public ArrayList<BoardDTO> selectBoardList(int pageNum, int listLimit,String search,String searchKind) {
		System.out.println("selectBoardList");
		ArrayList<BoardDTO> list = null;
		int startRow = (pageNum - 1) * listLimit;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM board where "+searchKind+" Like ? ORDER BY board_re_ref DESC, board_re_seq ASC LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);

			rs = pstmt.executeQuery();

			list = new ArrayList<BoardDTO>();

			while (rs.next()) {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_name(rs.getString("board_name"));
				dto.setBoard_pass(rs.getString("board_pass"));
				dto.setBoard_subject(rs.getString("board_subject")); 
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_file(rs.getString("board_file")); 
				dto.setBoard_realFile(rs.getString("board_real_file"));

				list.add(dto);
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close(rs);
		close(pstmt);
	

		return list;
	}
	public int selectListCount()  {
		System.out.println("selectListCount");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(board_num) FROM board";
		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			listCount = 0;
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
			System.out.println(listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		
		
		return listCount;
	}
	public BoardDTO selectBoard(int board_num)  { 
		BoardDTO dto =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM board WHERE board_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_name(rs.getString("board_name"));
				dto.setBoard_pass(rs.getString("board_pass"));
				dto.setBoard_subject(rs.getString("board_subject")); 
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_date(rs.getDate("board_date"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_file(rs.getString("board_file")); 
				dto.setBoard_realFile(rs.getString("board_real_file"));
				
				
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		
		
		return dto;
	}
	public int updateReadcount(int board_num)  {
		// DB 작업에 필요한 문자열 선언
		PreparedStatement pstmt = null;
		int updateCount=0;
		// 3단계. SQL 구문 작성 및 전달
		String sql = "UPDATE board SET board_readcount=board_readcount+1 WHERE board_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			updateCount=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 자원 반환
	
		close(pstmt);
		return updateCount;
		
	}
	public boolean isBoardWriter(int board_num, String board_pass) {
		boolean isBoardWriter = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 글번호와 패스워드가 모두 일치하는 레코드 조회
			String sql = "SELECT * FROM board WHERE board_num=? AND board_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 조회 결과 있음 = 번호에 해당하는 패스워드가 일치한다
				isBoardWriter = true; // 결과값을 true 로 변경
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - isBoardWriter() : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isBoardWriter;
	}
	
	// 글 삭제 작업 수행하는 deleteBoard()
	public int deleteBoard(int board_num) {
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM board WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - isBoardWriter() : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	public int updateBoard(BoardDTO dto)  { 
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET board_name=?,board_subject=?,board_content=? WHERE board_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_name());
			pstmt.setString(2, dto.getBoard_subject());
			pstmt.setString(3, dto.getBoard_subject());
			pstmt.setInt(4, dto.getBoard_num());
			updateCount = pstmt.executeUpdate();
						
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		close(pstmt);

		return updateCount;
	}
	public int insertReplyBoard(BoardDTO dto) {
		PreparedStatement pstmt = null, pstmt2=null;
		ResultSet rs = null;
		System.out.println("insertBoard");
		int insertCount = 0;
		String sql = "SELECT MAX(board_num) FROM board";
		int num = 1;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql="UPDATE board SET board_re_seq=board_re_seq+1 where board_re_ref=? AND board_re_seq>?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, dto.getBoard_re_ref());
			pstmt2.setInt(2, dto.getBoard_re_seq());
			pstmt2.executeUpdate();
			sql = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, dto.getBoard_name());
			pstmt2.setString(3, dto.getBoard_pass()); 
			pstmt2.setString(4, dto.getBoard_subject());
			pstmt2.setString(5, dto.getBoard_content());
			pstmt2.setString(6, "");
			pstmt2.setString(7, "");
			
			pstmt2.setInt(8, dto.getBoard_re_ref());
			pstmt2.setInt(9, dto.getBoard_re_lev() + 1);
			pstmt2.setInt(10, dto.getBoard_re_seq() + 1);
			pstmt2.setInt(11, 0);
		
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
		}
		
		
		return insertCount;
	}

}
