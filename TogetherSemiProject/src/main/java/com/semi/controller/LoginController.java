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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		
		// 로그인 여부를 판단할 세션
		String loginok = (String)session.getAttribute("loginok");
		
		// 이메일 정보, 이메일 저장 여부에 대한 세션
		String loginemail=(String)session.getAttribute("loginok");
		
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
	
	@GetMapping("/naverjoin")
	public String naverJoinPage(String email, String gender,
			String birthday, String name, Model model)
	{
		model.addAttribute("email", email);
		model.addAttribute("gender", gender);
		model.addAttribute("birthday", birthday);
		model.addAttribute("name", name);
		
		return "/sub/user/naverjoin";
	}
	
	@GetMapping("/callback")
	public String callbackPage()
	{	
		return "/sub/user/callback";
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
	


//	@GetMapping("/mypagedetail")
//	public String mypagedetail(@RequestParam("unum") int unum, @RequestParam(required = false) Integer photo_idx, Model model) {
//	UserDto dto = loginMapper.getMypage(unum);
//	UserPhotoDto pdto = new UserPhotoDto(); // 초기화
//	if (dto == null) {
//	// 해당 유저를 찾을 수 없는 경우 에러 페이지 등을 보여줄 수 있습니다.
//	return "error";
//	} else if(photo_idx != null) {
//	pdto = loginMapper.getMyPhoto(unum);
//	}
//	model.addAttribute("dto", dto);
//	model.addAttribute("pdto", pdto);
//	return "/main/user/mypagedetail";
//	}
//		
	
	@GetMapping("/mypagedetail")
	public String mypageDetail(@RequestParam("unum") int unum, @RequestParam(required = false) Integer photo_idx, Model model) {
	    // 로그인한 사용자 아이디를 가져옵니다.
	    UserDto dto = loginMapper.getMypage(unum);
	    if (dto == null) {
	        // 해당 유저를 찾을 수 없는 경우 에러 페이지 등을 보여줄 수 있습니다.
	        return "error";
	    }

	    model.addAttribute("dto", dto);

	    // 사용자 프로필 사진 정보 가져오기
	    List<UserPhotoDto> photoList = loginMapper.getMyProfilePhotos(unum);
	    if (photoList != null && !photoList.isEmpty()) {
	        // 대표 사진이 지정되지 않은 경우 photo_idx 파라미터로 지정된 값을 사용합니다.
	        // photo_idx 파라미터가 없는 경우 첫 번째 사진을 대표 사진으로 사용합니다.
	        int index = (photo_idx != null && photo_idx < photoList.size()) ? photo_idx : 0;
	        UserPhotoDto pdto = photoList.get(index);
	        model.addAttribute("pdto", pdto);
	        model.addAttribute("photoList", photoList);
	    } else {
	        model.addAttribute("pdto", null);
	        model.addAttribute("photoList", null);
	    }

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
  
	@GetMapping("/otherlogin")
	@ResponseBody
	public void otherLogin(@RequestParam String email,
			HttpSession session)
	{
		session.setAttribute("loginok", "yes");
		
		int unum = loginService.selectOneOfEmail(email).getUnum();
		session.setAttribute("unum", unum);
		
		System.out.println("로그인 성공");
	}
	
	 @PostMapping("/loginaction") 
	 public String loginAction(
			 @RequestParam String email,
			 @RequestParam String pass,
			 @RequestParam (required = false) String saveemail,
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
			 session.setAttribute("loginemail", email);
			 session.setAttribute("saveemail", saveemail == null?"no":"yes");
			 
			 // 로그인 unum 세션에 저장
			 int unum = loginService.selectOneOfEmail(email).getUnum();
			 session.setAttribute("unum", unum);
			 
			 // 로그인 uname 세션에 저장
			 String uname = loginService.selectOneOfEmail(email).getUname();
			 session.setAttribute("uname", uname );
			 
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
		 session.removeAttribute("unum"); 
		 return "redirect:/";
	 }
	 
	  @ResponseBody //값 변환을 위해 꼭 필요함
	  @GetMapping("emailCheck")//아이디 중복확인을 위한 값으로 따로 매핑
	  public int overlappedMname(UserDto dto) throws Exception{
		  int result=loginService.overlappedEmail(dto);//중복 확인한 값을 int로 받음
		  return result;
	  }
   
}