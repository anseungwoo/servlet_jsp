<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="jsp14_java_mail.GmailSMTPAuthenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 작성된 메일 항목 파라미터 변수에 저장
request.setCharacterEncoding("UTF-8");

String sender = request.getParameter("sender"); // 보내는 사람 주소
String receiver = request.getParameter("receiver"); // 받는 사람 주소
String subject = request.getParameter("subject"); // 메일 제목
String content = request.getParameter("content"); // 메일 본문

try {
	// ---------------- 메일 전송을 위한 설정 작업 -----------------
	// 메일 전송 프로토콜 : SMTP(Simple Mail Tranfer Protocol) - TCP 587번 포트 사용(Gmail 기준)
	// => 시스템(서버)의 속성 정보(= 서버 정보)를 java.util.Properties 객체로 리턴받기
	Properties properties = System.getProperties();
	// 메일 전송에 필요한 기본 설정 정보를 서버 속성 정보에 추가 - Properties 객체의 put() 메서드 사용
	// 메일 전송에 사용할 메일 서버 지정(구글, 네이버, 아웃룩 등)
	properties.put("mail.smtp.host", "smtp.gmail.com"); // 구글(Gmail) SMTP 서버
	properties.put("mail.smtp.auth", "true"); // SMTP 서버에 대한 인증 여부 설정
	properties.put("mail.smtp.port", "587"); // SMTP 서비스 포트 설정
	// 메일 인증 정보 설정
	properties.put("mail.smtp.starttls.enable", "true"); // TLS 인증 사용 여부 설정
	properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 인증 프로토콜 버전 설정
	// 만약, TLS 버전 문제 발생(could not convert socket to TLS) 시 다음 코드 추가
// 	properties.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // 인증 프로토콜 버전 설정
	
	// 메일 서버 인증 정보를 생성하는 사용자 정의 클래스의 인스턴스 생성
	Authenticator authenticator = new GmailSMTPAuthenticator(); // 업캐스팅 활용
	
	// 자바 메일에서 메일 전송 기본 단위를 javax.mail.Session 객체 단위로 관리하므로
	// Session 클래스의 getDefaultInstance() 메서드를 호출하여 객체 얻어오기
	// => 파라미터 : 서버 정보와 인증 정보 전달
	Session mailSession = Session.getDefaultInstance(properties, authenticator);
	
	// 서버와 인증 정보를 포함하는 MimeMessage 객체 생성
	// => 파라미터로 Session 객체 전달
	// => 생성된 MimeMessage 객체를 통해 전송할 메일에 대한 정보 생성
	Message mailMessage = new MimeMessage(mailSession); // 업캐스팅
	
	// 전송할 메일에 대한 정보 설정
	// 1. 발신자 정보 설정
	// => 단, 스팸 메일 정책으로 인해 상용 메일 사이트(구글, 네이버 등)는 발신자 주소 변경 불가능
	Address senderAddress = new InternetAddress(sender, "아이티윌");
	// 2. 수신자 정보 설정
	Address receiverAddress = new InternetAddress(receiver);
	// 3. Message 객체를 통해 전송할 메일에 대한 내용 정보 설정
	// 3-1) 메일 헤더 정보 설정
	mailMessage.setHeader("content-Type", "text/html; charset=UTF-8");
	// 3-2) 발신자 정보 설정
	mailMessage.setFrom(senderAddress);
	// 3-3) 수신자 정보 설정
	mailMessage.addRecipient(RecipientType.TO, receiverAddress);
	// 3-4) 메일 제목 설정
	mailMessage.setSubject(subject);
	// 3-5) 메일 본문 설정
	mailMessage.setContent(content, "text/html; charset=UTF-8");
	// 3-6) 메일 전송 날짜 및 시각 정보 설정(java.util.Date 객체 생성을 통해 시스템 시각 정보로 설정)
	mailMessage.setSentDate(new Date());
	
	// 4. 메일 전송
	// javax.mail.Transport 클래스의 static 메서드 send() 호출
	Transport.send(mailMessage);
	out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
} catch(Exception e) {
	e.printStackTrace();
	out.println("<h3>SMTP 서버 설정 또는 서비스 문제 발생!</h3>");
}

%>

















