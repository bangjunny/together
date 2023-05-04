package com.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.dto.UserDto;
import com.semi.service.LoginService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/user")
public class LoginController {	
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="together-bucket-104";
	
	
	
	@GetMapping("/login")
	public String newLoginPage(HttpSession session) {
		String loginok = (String)session.getAttribute("loginok");
		
		if(loginok==null) 
		{ 
			return "/main/user/login"; 
		} 
		else 
		{ 
			return "/main/moim/moimlist";  
		} 	
		
	}
	
	@GetMapping("/join")
	public String userJoinPage() {
		return "/main/user/join";
		}
	
	@PostMapping("/userinsert")
	public String userinsert(UserDto dto){
		System.out.println(dto);
		loginService.insertUser(dto);
		
		return "redirect:/user/login";
	}
	
	
       
	
	 @PostMapping("/loginaction") 
	 public String loginAction(
			 @RequestParam String email,
			 @RequestParam String pass, 
			 HttpSession session) 
	 { 
		 // 이메일과 비번이 일치한지 체크 
		 System.out.println("email="+email);
		 System.out.println("pass="+pass);
		 int count = loginService.isEqualPassEmail(email, pass);
		 
		 if(count==1) { 
			 // 세션 시간 
			 session.setMaxInactiveInterval(60*60*5);
			 
			 // 로그인 성공시 세션에 저장 
			 session.setAttribute("loginok", "yes");
			 
			 // 로그인 unum 세션에 저장
			 int unum = loginService.selectOneOfEmail(email).getUnum();
			 session.setAttribute("unum", unum); 
			 
			 System.out.println("로그인 성공"); 
			 return "redirect:/"; 
		} 
		else { 
			System.out.println("로그인 실패"); 
			return "/main/user/loginfail"; 
		} 
	 }
	 
	 @GetMapping("/logout") 
	 public String logout(HttpSession session) 
	 {
		 session.removeAttribute("loginok"); 
		 return "redirect:/";
	 }
	 
   
}