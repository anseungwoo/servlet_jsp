package com.newlecture.web.entity;

import java.sql.Date;

public class NoticeView extends Notice {
	private int cmtCount;
	
	public int getcmtCount() {
		return cmtCount;
	}
	public void setcmtCount(int cmtcount) {
		this.cmtCount = cmtcount;
	}
	
	public NoticeView() {}
	public NoticeView(int id, String title, String writerId, Date regDate, String content, int hit, String files,
			int cmtCount) {
		super(id, title, writerId, regDate, content, hit, files);
		this.cmtCount=cmtCount;
	}


	
}
