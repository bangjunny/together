package com.semi.service;

import org.apache.ibatis.javassist.Loader.Simple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	@Autowired
	JavaMailSender inEmail;		// 자바 메일 기능
	
	
	
	public void suEmail(String inemail, String code) {
		
		SimpleMailMessage msg = new SimpleMailMessage();
		
		msg.setFrom("together2jo@naver.com");				// 보내는 사람 이메일 주소
		msg.setTo(inemail);									// 받는 사람 이메일
		msg.setSubject("[다 함께] 이메일 인증번호입니다.");	// 이메일 제목
		msg.setText("[다 함께] 인증 번호 : " + code);		// 이메일 내용
		
		inEmail.send(msg);
	}
	
	// 이메일 중복체크
//	public String chEmail(String inemail, String email) {
//		
//		String result;
//		
//		if(inemail.equals(email)) {
//			
//			result = false;
//		}
//		else {
//			result = true;
//		}
//		return "result";
//	}
	
	// 인증번호 맞았을때
	
	
}

	
	











