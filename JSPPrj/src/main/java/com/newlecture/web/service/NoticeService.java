package com.newlecture.web.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.entity.NoticeView;

public class NoticeService {
    public int	removeNoticeAll(int[] ids){
    	
    	return 0;
    }
    
    public int pubNoticeAll(int[] ids){
    	return 0;
    }
    public int insertNotice(Notice notice){
    	return 0;
    }
	
    public int deleteNotice(int id){
    	return 0;
    }
    public int updateNotice(Notice notice){
    	return 0;
    }
    public List<Notice> getNoticeNewestList(){
    	return null;
    }
	
	
	
	
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public List<NoticeView> getNoticeList() {
		return getNoticeList(1, "title", "");
	}

	public List<NoticeView> getNoticeList(int page) {
		return getNoticeList(page, "title", "");
	}

	public List<NoticeView> getNoticeList(int page, String field, String query) {
		int listLimit = 10;
		int pageLimit = 10;

		int start = (page-1) *10;

		int end = 10; // 10, 20, 30, 40...

		String sql = "select * from notice_view WHERE " + field + " LIKE ? ORDER BY REGDATE DESC LIMIT ?,?";

		List<NoticeView> list = new ArrayList<NoticeView>();

		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				Date regDate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("hit");
				String files = rs.getString("FILES");
				int cmtCount= rs.getInt("cmt_count");

				NoticeView notice = new NoticeView(
						id, title, writerId, 
						regDate, content, hit, 
						files, cmtCount
						);

				list.add(notice);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);
		return list;

	}

	public int getNoticeCount() {
		return getNoticeCount("title", "");
	}

	public int getNoticeCount(String field, String query) {
		int count=0;
		String sql = "select COUNT(ID) from notice";


		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
		
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt(1);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);
		return count;
	}

	public Notice getNotice(int id) {
		String sql = "select * from notice WHERE ID=?";
		Notice notice=null;
		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id1= rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				Date regDate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("hit");
				String files = rs.getString("FILES");

				notice = new Notice(id1, title, writerId, regDate, content, hit, files);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);
		return notice;
	}

	public Notice getNextNotice(int id) {
		String sql = "select * from notice where  ID>? order by regdate desc limit 1";
		Notice notice=null;
		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id1= rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				Date regDate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("hit");
				String files = rs.getString("FILES");

				notice = new Notice(id1, title, writerId, regDate, content, hit, files);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);
		return notice;
	}

	public Notice getPrewNotice(int id) {
		String sql = "select * from notice where  ID<? order by regdate desc limit 1";
		Notice notice=null;
		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id1= rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				Date regDate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("hit");
				String files = rs.getString("FILES");

				notice = new Notice(id1, title, writerId, regDate, content, hit, files);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);
		return notice;
	}

	public int deleteNoticeAll(int[] ids) {
		int result=0;
		String params="";
		for(int i=0;i<ids.length;i++) {
			params+=ids[i];
			if(i<ids.length-1) {
				params+=",";
				
			}
		}
		String sql = "DELTE FROM NOTICE WHERE ID IN ("+params+")";
		Notice notice=null;
		try {
			con = JdbcUtill.getConnection();
			pstmt = con.prepareStatement(sql);
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JdbcUtill.close(rs);
		JdbcUtill.close(pstmt);
		JdbcUtill.close(con);

		return result;
	}

}
