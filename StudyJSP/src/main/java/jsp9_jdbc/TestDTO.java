package jsp9_jdbc;

public class TestDTO {
	// 1. 데이터를 저장할 인스턴스 멤버변수 2개 선언(번호(idx), 이름(name))
	private int idx;
	private String name;
	
	// 2.멤버변수에 접근할 getter/setter 메서드 정의	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
