package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.dto.UserDto;
import com.semi.mapper.LoginMapper;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/user")
public class LoginController {	
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="together-bucket-104";
	
	@GetMapping("/logout")
	public String logoutPage() {
		return "/main/user/logout";
		}
	
	@GetMapping("/login")
	public String newLoginPage() {
		return "/main/user/login";
		}
	
	@GetMapping("/join")
	public String userJoinPage() {
		return "/main/user/join";
		}
	
	@PostMapping("/userinsert")
	public String userinsert(UserDto dto){
		System.out.println(dto);
		loginMapper.insertUser(dto);
		
		return "redirect:/user/login";
	}
       
       
   
   
}