package com.semi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.mapper.LoginMapper;
import com.semi.service.LoginService;
import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/user")
public class LoginController {	
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private LoginService loginService;
	
	List<String> photoNames=new ArrayList<>();
	
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
	
	@GetMapping("/mypagelist")
	public String list(Model model)
	{
		//총 상품갯수 출력
		int utotalCount=loginMapper.getTotalCount();
		//전체 데이타 가져오기
		List<UserDto> list=loginMapper.getAllUsers();

		//model 에 저장
		model.addAttribute("utotalCount", utotalCount);
		model.addAttribute("list", list);

		return "/main/user/mypagelist";
	}
		
	
	@GetMapping("/mypagedetail")
	public String detail(int unum,Model model)
	{
		
		UserDto dto=loginMapper.getMypage(unum);
		model.addAttribute("dto", dto);
		
		return "/main/user/mypagedetail";
	}
   
   
}