package com.semi.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	List<String> photoNames=new ArrayList<>();
	
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
		
	
	@GetMapping("/mypagedetail")
	public String detail(int unum,Model model)
	{
		
		UserDto dto=loginMapper.getMypage(unum);
		model.addAttribute("dto", dto);
		
		return "/sub/user/mypagedetail";
	}
   
	@PostMapping("/mypageupdatephoto")
	@ResponseBody public String mypageupdatephoto(MultipartFile upload,int unum)
	{
		System.out.println("unum="+unum);
		//s3 스토리지에 업로드된 기존 파일 지우기
		String fileName=loginMapper.getMypage(unum).getUphoto();
		storageService.deleteFile(bucketName, "user", fileName);

		//네이버 클라우드의 버켓에 사진 업로드하기
		String uphoto=storageService.uploadFile(bucketName, "user", upload);
		Map<String, Object> map=new HashMap<>();
		map.put("uphoto", uphoto);
		map.put("unum", unum);

		loginMapper.updatePhoto(map);
		return uphoto;//업로드된 파일명 리턴
	}
	
	@GetMapping("/updatemypage")
	@ResponseBody public void updatemypage(UserDto dto)
	{
		System.out.println("dto.unum="+dto.getUnum());
		loginMapper.updateMypage(dto);
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