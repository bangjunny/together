package com.semi.controller;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.service.EmailService;

@Controller
public class EmailController {

	@Autowired
	EmailService emailService;
	
	HashMap<String, String> hmap =new HashMap<String, String>();
	
	@GetMapping("/inemail")
	@ResponseBody
	public void suEmail(String inemail)
	{
		//System.out.println(inemail);
		
//		Random random = new Random();	// 000000~999999 난수 발생
//		String code = String.valueOf(random.nextInt(999999));
		
		String code = String.valueOf((int)(Math.random() * (999999 - 100000 + 1) + 100000));	// 100000~999999 난수 발생
		emailService.suEmail(inemail, code);
		// System.out.println(code);
		
		hmap.put("code",code);
		
	}
	
	// 이메일 중복체크
	@GetMapping("/chemail")
	@ResponseBody
	public boolean chEmail(String inemail) {
		
		int result = emailService.chEmail(inemail);
		//System.out.println(result);
		
		if(result==1) {			// if(result)로 사용하려면 안에 변수가 boolean 타입이여야 한다
			return false;		// 함수가 boolean 타입이기 때문에 return 값이 true와 false가 될수 있다
		}
		else {
			return true;
		}
	}
	
	// 인증메일 확인
	@GetMapping("/chcode")
	@ResponseBody
	public boolean chCode(String code)
	{
		String hcode = hmap.get("code");
		// System.out.println(hcode);
		
		if(hcode.equals(code)) {
			return true;	
		}
		else {
			return false;
		}
	}
	
}













