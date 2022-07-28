package jsp9_jdbc;

public class Test8_1DTO {
	// test8_1 테이블 컬럼에 대응하는 멤버변수, Getter/Setter 정의
	private String name;
	private int age;
	private String gender;
	private String hobby;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
}
