package com.semi.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.semi.dto.CityBoardDto;
import com.semi.dto.JJimDto;
import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.mapper.LoginMapper;
import com.semi.mapper.MoimMapper;
import com.semi.service.LoginService;
import com.semi.service.MoimService;

import org.springframework.web.bind.annotation.RequestParam;



import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/user")
public class LoginController {	
	
	@Autowired
	LoginService loginService;
	@Autowired
	MoimService moimService;

	@Autowired
	LoginMapper loginMapper;
	
	
	@Autowired
	MoimMapper moimMapper;
	
	
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
	
	@PostMapping("/soinsert")
	public String insertSo(UserDto dto){
		System.out.println(dto);
		loginService.insertSo(dto);
		
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
	        return "redirect:/user/login"; // 로그인하지 않은 사용자는 로그인 페이지로 이동
	    }else if(loginUserUnum == 1){
	    	return "redirect:/user/mypagelist"; 
	    }
	    else {
	        return "redirect:/user/mypagedetail?unum=" + loginUserUnum; // 로그인한 사용자는 자신의 mypagedetail 페이지로 이동
	    }
	}

	@GetMapping("/mypagedetail")
	public String mypageDetail(@RequestParam(defaultValue = "1") int currentPage, @RequestParam("unum") int unum, Integer mnum, @RequestParam(required = false) Integer is_main, Model model) {
	
	    
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
	    	 UserPhotoDto pdto = photoList.get(0); // 항상 첫 번째 요소 사용
	    	model.addAttribute("pdto", pdto);
	        model.addAttribute("photoList", photoList);
	    } else {
	    	model.addAttribute("pdto", null);
	        model.addAttribute("photoList", null);
	    }

	    // 모임 리스트 가져오기
	    List<MoimDto> moimList = loginMapper.getMyMoimList(unum);
	    model.addAttribute("moimList", moimList);
	 // 찜모임 리스트 가져오기
	    List<Map<String, Object>> jjimList = loginService.getJJimMoimList(unum);
	    model.addAttribute("jjimList", jjimList);
	    
	 //가입한 모임의 리스트 가져오기    
	    List<Map<String, Object>> gaipMoimList = loginService.getGaipMoimList(unum);
		model.addAttribute("gaipMoimList" , gaipMoimList);
	    
	    return "/main/user/mypagedetail";
	
	 }	
	 @GetMapping("/myjjimList")
	   private String MyJJimList(@RequestParam("unum") int unum, Model model)
	   {
		 
		 List<Map<String, Object>> jjimList = loginService.getJJimMoimList(unum);
		 model.addAttribute("jjimList", jjimList);
		    
		    return "/main/user/myjjimlist";
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
	        loginMapper.updateMainphoto(pdto.getPhoto_idx(),unum);
	        // db insert
	        loginMapper.insertMyPhoto(pdto);
	        
	        return "redirect:mypage";
	    } catch (Exception e) {
	        //e.printStackTrace();
	        // 에러 발생 시 alert 창 띄우기
	        return "redirect:mypage?result=error";
	    }
	}
	@GetMapping("/deletephoto")
	@ResponseBody public void deletePhoto(int photo_idx)
	{
		//db의 데이타 삭제전 스토리지 사진부터 삭제하기
		
		//photo_idx 에 해당하는 파일명 얻기
		String photoname=loginService.getSelectPhoto(photo_idx);
		//스토리지에서 사진 삭제
		storageService.deleteFile(bucketName, "userphoto", photoname);
		//db 에서도 삭제
		loginService.deletePhoto(photo_idx);
	}
	
	@GetMapping("/updatephoto")
	@ResponseBody public void updatePhoto(int photo_idx,HttpSession session)
	{
		 int unum = (int) session.getAttribute("unum"); // 세션에서 unum 값 가져오기
		loginMapper.updateMainphoto(photo_idx,unum);
	}
	
	@PostMapping("/mypagePassCheck")
	public String mypagepasscheck(@RequestParam String pass,HttpSession session)
	{
		int unum = (int) session.getAttribute("unum"); // 세션에서 unum 값 가져오기
		
		boolean pck=loginService.mypagePassCheck(unum, pass);
		if(pck) {
			return "redirect:/user/mypageupdateform?unum=" + unum;			
		}else {
			 return "error";
		}
		
	}
	@GetMapping("/mypageupdateform")
	public String mypageupdateform(@RequestParam("unum") int unum,Model model)
	{
		// 로그인한 사용자 아이디를 가져옵니다.
	    UserDto dto = loginMapper.getMypage(unum);
	    if (dto == null) {
	        // 해당 유저를 찾을 수 없는 경우 에러 페이지 등을 보여줄 수 있습니다.
	        return "error";
	    }

	    model.addAttribute("dto", dto);
	    return "/main/user/mypageupdateform";
	}
	
	@PostMapping("/updatemypage")
	public String update(UserDto dto)
	{		
		//수정
		loginService.updateMypage(dto);
		
		//수정후 내용보기로 이동한다
		return "redirect:/user/mypagedetail?unum="+dto.getUnum();
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
	  
	  @GetMapping("/mypagecblist")
	  public String mypageCblist(@RequestParam(defaultValue = "1") int currentPage, Model model, @RequestParam("unum") int unum)
	  {
		  
		// 게시물의 총 글 갯수
			int totalCount = loginService.getMyCBWRCount(unum);			
					
			int totalPage;// 총페이지수
			int perPage = 10;// 한페이지당 보여질 글의 갯수
			int perBlock = 5;// 한 블럭당 보여질 페이지 갯수
			int startNum;// 각 페이지에서 보여질 글의 시작번호
			int startPage;// 각 블럭에서 보여질 시작페이지 번호
			int endPage;// 각 블럭에서 보여질 끝 페이지 번호'
			int no;// 글출력시 출력할 시작번호
			// 총 페이지 수
			totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
			// 시작 페이지
			startPage = (currentPage - 1) / perBlock * perBlock + 1;
			// 끝 페이지
			endPage = startPage + perBlock - 1;
			// 이때 문제점
			if (endPage > totalPage)
				endPage = totalPage;
			// 각페이지의 시작번호(1페이지 :0, 2페이지 :3, 3페이지:6....)
			startNum = (currentPage - 1) * perPage;
			// 각 글마다 출력할 글 번호(예: 10개 일 경우 1페이지 :10, 2페이지 :7....)
			no = totalCount - startNum;
  
			// 내가 쓴 글 리스트 가져오기
			  List<CityBoardDto> cbList = loginService.getMyCBList(startNum, perPage, unum);			  
			  model.addAttribute("totalCount", totalCount);
				model.addAttribute("cbList", cbList);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);
				model.addAttribute("unum", unum);
			  return "/main/user/mypagecblist";
	  }
	  
	  @GetMapping("/mypagecblikelist")
	  public String mypagecbLike(@RequestParam(defaultValue = "1") int currentPage, Model model, @RequestParam("unum") int unum)
	  {
		  
		// 게시물의 총 글 갯수
			int totalCount = loginService.getMyCBLikeCount(unum);		
					
			int totalPage;// 총페이지수
			int perPage = 10;// 한페이지당 보여질 글의 갯수
			int perBlock = 5;// 한 블럭당 보여질 페이지 갯수
			int startNum;// 각 페이지에서 보여질 글의 시작번호
			int startPage;// 각 블럭에서 보여질 시작페이지 번호
			int endPage;// 각 블럭에서 보여질 끝 페이지 번호'
			int no;// 글출력시 출력할 시작번호
			// 총 페이지 수
			totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
			// 시작 페이지
			startPage = (currentPage - 1) / perBlock * perBlock + 1;
			// 끝 페이지
			endPage = startPage + perBlock - 1;
			// 이때 문제점
			if (endPage > totalPage)
				endPage = totalPage;
			// 각페이지의 시작번호(1페이지 :0, 2페이지 :3, 3페이지:6....)
			startNum = (currentPage - 1) * perPage;
			// 각 글마다 출력할 글 번호(예: 10개 일 경우 1페이지 :10, 2페이지 :7....)
			no = totalCount - startNum;
  
			// 내가 쓴 글 리스트 가져오기
			 // 내가 추천한 글 리스트 가져오기 		    
			  List<CityBoardDto> cbLikeList = loginService.getCbLikeList(startNum, perPage, unum);			  
			  	model.addAttribute("totalCount", totalCount);
				model.addAttribute("cbLikeList", cbLikeList);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);
				model.addAttribute("unum", unum);
			  return "/main/user/mypagecblikelist";
	  }
	  
	  
   
}