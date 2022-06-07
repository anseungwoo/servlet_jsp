package com.newlecture.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.entity.Notice;
@WebServlet("/notice/list")
public class NoticeListController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/xepdb1";
	String user = "root";
	String password = "1234";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Notice> list = new ArrayList<Notice>();
	try {
		Class.forName(driver);
		System.out.println("드라이버 로드 성공!");

		con = DriverManager.getConnection(url, user, password);
		String sql = "SELECT * FROM NOTICE";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next()){
		    int id = rs.getInt("ID");
		    String title = rs.getString("TITLE");
		    String writerId = rs.getString("WRITER_ID");
		    Date regDate = rs.getDate("REGDATE");
		    String content = rs.getString("CONTENT");
		    int hit = rs.getInt("hit");
		    String files = rs.getString("FILES");
		    
		    Notice notice = new Notice(
		    					id,
		    					title,
		    					writerId,
		    					regDate,
		    					content,
		    					hit,
		    					files
		    				);

		    list.add(notice);
		    
		}
		
		con.close();
		pstmt.close();
		rs.close();
	} catch (

	ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	request.setAttribute("list", list);
	request.getRequestDispatcher("/WEB-INF/view/notice/list.jsp").forward(request, response);
	
	

}
}
