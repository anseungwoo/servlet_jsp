package jsp15_java_mail2;

public class ActionForward {
	private String path; // 포워딩 주소를 저장할 변수
	private boolean isRedirect; // 포워딩 방식을 저장할 변수(true : Redirect, false : Dispatcher)
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
