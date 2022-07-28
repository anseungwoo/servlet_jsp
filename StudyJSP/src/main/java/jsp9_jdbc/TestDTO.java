package jsp9_jdbc;

// DTO(Data Tranfer Object, 데이터 전송 객체) 역할을 수행할 TestDTO 클래스 정의
// => testForm.jsp 페이지에서 입력받은 폼 데이터를 저장하고
//    TestDAO 객체에서 조회된 데이터를 저장하는 역할
// => 이 객체에 데이터를 담아 JSP 페이지와 DAO 객체 사이에서 주고 받는 용도로 사용
public class TestDTO {
	// 1. 데이터를 저장할 인스턴스 멤버변수 2개 선언(번호(idx), 이름(name))
	private int idx;
	private String name;
	
	// 2. 멤버변수에 접근할 Getter/Setter 메서드 정의
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














