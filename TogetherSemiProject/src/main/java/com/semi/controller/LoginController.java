package com.semi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.mapper.LoginMapper;

import com.semi.service.LoginService;
import org.springframework.web.bind.annotation.RequestParam;



import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/user")
public class LoginController {	
	
	@Autowired
	LoginService loginService;

	@Autowired
	LoginMapper loginMapper;
	
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="together-bucket-104";
	
	
	
	@GetMapping("/login")
	public String newLoginPage(HttpSession session) {
		String loginok = (String)session.getAttribute("loginok");
		
		if(loginok==null) 
		{ 
			return "/sub/user/login"; 
		} 
		else 
		{ 
			return "/main/moim/moimlist";  
		} 	
		
	}
		
	@GetMapping("/join")
	public String userJoinPage() {
		return "/sub/user/join";
		}
	
	@GetMapping("/kakaojoin")
	public String kakaoJoinPage(String email, String gender, 
			String birthday, String nickname, Model model) {
		
		model.addAttribute("email",email);
		model.addAttribute("gender",gender);
		model.addAttribute("birthday",birthday);
		model.addAttribute("nickname",nickname);
		
		System.out.println(email);
		return "/sub/user/kakaojoin";
	}
	
	@PostMapping("/userinsert")
	public String userinsert(UserDto dto){
		System.out.println(dto);
		loginService.insertUser(dto);
		
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
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
	    Integer loginUserUnum = (Integer) session.getAttribute("unum"); // 로그인한 사용자의 unum 값 가져오기
	    if (loginUserUnum == null) {
	        return "redirect:/login"; // 로그인하지 않은 사용자는 로그인 페이지로 이동
	    } else {
	        return "redirect:/user/mypagedetail?unum=" + loginUserUnum; // 로그인한 사용자는 자신의 mypagedetail 페이지로 이동
	    }
	}

	@GetMapping("/mypagedetail")
	public String mypagedetail(@RequestParam("unum") int unum, @RequestParam(required = false) Integer photo_idx, Model model) {
	UserDto dto = loginMapper.getMypage(unum);
	UserPhotoDto pdto = new UserPhotoDto(); // 초기화
	if (dto == null) {
	// 해당 유저를 찾을 수 없는 경우 에러 페이지 등을 보여줄 수 있습니다.
	return "error";
	} else if(photo_idx != null) {
	pdto = loginMapper.getMyPhoto(unum);
	}
	model.addAttribute("dto", dto);
	model.addAttribute("pdto", pdto);
	return "/main/user/mypagedetail";
	}
		

	
	@PostMapping("/mypageinsert")
	public String insertMyPhoto(UserPhotoDto pdto, MultipartFile upload, HttpSession session) {
	    try {
	        int unum = (int) session.getAttribute("unum"); // 세션에서 unum 값 가져오기

	        // 네이버 클라우드의 버켓에 사진 업로드하기
	        String photo = storageService.uploadFile(bucketName, "userprofile", upload);
	        // 반환된 암호화된 파일명을 dto에 넣기
	        pdto.setFile_name(photo);
	        pdto.setUnum(unum);

	        // db insert
	        loginMapper.insertMyPhoto(pdto);

	        return "redirect:mypage";
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 에러 발생 시 alert 창 띄우기
	        return "redirect:mypage?result=error";
	    }
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
	 
	  @ResponseBody //값 변환을 위해 꼭 필요함
	  @GetMapping("emailCheck")//아이디 중복확인을 위한 값으로 따로 매핑
	  public int overlappedMname(UserDto dto) throws Exception{
		  int result=loginService.overlappedEmail(dto);//중복 확인한 값을 int로 받음
		  return result;
	  }
   
}