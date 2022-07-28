package jsp10_board;

import java.sql.Timestamp;

/*
CREATE TABLE board_reply (
	idx INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(16) NOT NULL,
	content VARCHAR(500) NOT NULL,
	date DATETIME NOT NULL,
	ref INT NOT NULL,
);
*/
public class BoardReplyDTO {
	private int idx;
	private String id;
	private String content;
	private Timestamp date;
	private int ref; // 댓글의 원본 게시물 번호
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
}















