package com.semi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.MoimDto;
import com.semi.dto.MoimMemberDto;
import com.semi.dto.UserDto;
import com.semi.mapper.MoimMapper;
import com.semi.service.CityService;
import com.semi.service.MoimService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/moim")
public class MoimController {
   
	@Autowired
	MoimMapper moimMapper;
	
	@Autowired
	CityService cityService;
	
	//버켓이름지정
	private String bucketName="together-bucket-104";
		
	@Autowired
	private NcpObjectStorageService storageService;
	
   @Autowired
   private MoimService moimService;
      
   @GetMapping("/moimlist")
   private String moimlist(@RequestParam(defaultValue = "1") int currentPage,Model model, String category, HttpSession session,
		   String city1,String city2, String mcount, String sort)
   			{   		   	       		
	   		
	   		int unum;	   			   		
	   		
	   		if(session.getAttribute("unum")==null) {
	   			unum=0;	   			
	   		}else {
	   			unum=(int)session.getAttribute("unum");	   			
	   		}
	   		
	   		UserDto udto = cityService.getDetailbyunum(unum);
   			model.addAttribute("unum", unum);
			model.addAttribute("udto", udto);
	   		
	   		if (city1==null && category==null && session.getAttribute("unum")!=null) {
	   			category = udto.getCategory();
				city1 = udto.getCity1();
				city2 = udto.getCity2();
			}
	   		
	   		// 게시물의 총 글 갯수
			int totalCount = moimService.getTotalCount(category,city1,city2);			
					
			int totalPage;// 총페이지수
			int perPage = 12;// 한페이지당 보여질 글의 갯수
			int perBlock = 2;// 한 블럭당 보여질 페이지 갯수
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
			// 각페이지에 필요한 게시글 db에 가져오기			
			List<MoimDto> list = moimService.getPagingList(startNum, perPage, category, city1, city2, sort);			
			 
			// model 저장
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("list",list);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("no", no);
			model.addAttribute("category", category);
			model.addAttribute("city1",city1);
			model.addAttribute("city2",city2);
			model.addAttribute("mcount",mcount);
			model.addAttribute("sort", sort);
			
			
   return "/main/moim/moimlist";
   }
   
   @GetMapping("/moimdetail")
   private String moimdetail(int mnum, Model model, HttpSession session, String mname)
   {
	
	  //dto얻기
	  MoimDto dto=moimService.getData(mnum);
	  int unum = dto.getUnum();
	  
	  UserDto udto = cityService.getDetailbyunum(unum);
	  String uname = udto.getUname();
		model.addAttribute("unum", unum);
		model.addAttribute("udto", udto);
		model.addAttribute("uname", uname);
		
	  //model
	  if (session.getAttribute("unum") != null) {
		  unum = (int)session.getAttribute("unum");
		  boolean pressChk = moimService.pressJjim(unum, mnum);
      
		  boolean pressGaipChk = moimService.pressGaip(unum, mname);
		  
		  Integer acceptChk = moimService.acceptChk(unum, mname);

		  model.addAttribute("pressChk", pressChk);
		  model.addAttribute("pressGaipChk", pressGaipChk);
		  
		  if (acceptChk == null) {
			model.addAttribute("acceptChk", 0);
		  }else {
			model.addAttribute("acceptChk", acceptChk);			
		}
		  
	  	}  
	  List<Map<String, Object>> list = moimService.getGaipmemberList(mname);
	  model.addAttribute("list", list);
	  model.addAttribute("dto",dto);
	  	  
      return "/main/moim/moimdetail";
   	  }
   
   @GetMapping("/moimform")
   private String moimform()
   {
	   return "/main/moim/moimform";
   }
   
   @PostMapping("/insert")
	public String insert(MoimDto dto,MultipartFile upload, MoimMemberDto mdto)
	{
		//네이버 클라우드의 버켓에 사진 업로드하기
		String photo=storageService.uploadFile(bucketName, "moim", upload);
		//반환된 암호화된 파일명을 dto에 넣기
		dto.setMphoto(photo);
		
		//db insert
		moimMapper.insertMoim(dto);
		moimMapper.insertMoimMember(mdto);
		return "redirect:moimlist";
	}
   
   @GetMapping("/updateform")
   private String updateform(int mnum,Model model)
   {
	   MoimDto dto=moimService.getData(mnum);
	   model.addAttribute("dto",dto);
	   
	   return "/main/moim/moimupdateform";
   }
   @PostMapping("/update")
   public String update(MoimDto dto,MultipartFile upload)
   {
	   String mphoto="";
		// 사진선택시 기존사진을 버켓에서 지우고 재업로드
		if(!upload.getOriginalFilename().equals("")) {
			//기존파일 읽어오기
			mphoto=moimService.getData(dto.getMnum()).getMphoto();
			//버켓에서 삭제
			storageService.deleteFile(bucketName,"moim", mphoto);
			//재업로드
			mphoto=storageService.uploadFile(bucketName,"moim", upload);
		}
		dto.setMphoto(mphoto);
		// 수정하기
		moimService.updateMoim(dto);
		return "redirect:./moimdetail?mnum="+dto.getMnum();
   }
   @GetMapping("/delete")
	public String delete(int mnum)
	{
		//스토리지에 업로드된 기존파일 지우기!!
		String Mphoto=moimService.getData(mnum).getMphoto();
		storageService.deleteFile(bucketName,"moim", Mphoto);
		//db삭제
		moimService.deleteMoim(mnum);
		return "redirect:./moimlist";
	}
   @ResponseBody //값 변환을 위해 꼭 필요함
   @GetMapping("mnameCheck")//아이디 중복확인을 위한 값으로 따로 매핑
   public int overlappedMname(MoimDto dto) throws Exception{
	   int result=moimService.overlappedMname(dto);//중복 확인한 값을 int로 받음
	   return result;
   }
   
   @ResponseBody
   @GetMapping("/updateJjimcount")
   public String updateJjimcount(int mnum, int unum) {
       moimService.updateJjimcount(mnum, unum);
       return "success";
   }
   @ResponseBody
   @GetMapping("/deleteJjim")
   public String deleteJjimcount(HttpSession session, int mnum) {
	   int unum = (int) session.getAttribute("unum");
       moimService.deleteJjim(unum, mnum);
       return "success";
   }
   @ResponseBody
   @GetMapping("/moimgaip")
   public String moimgaip(HttpSession session, String mname) {
	   int unum = (int) session.getAttribute("unum");
       moimService.moimGaip(unum, mname);
       return "success";
   }
   @ResponseBody
   @GetMapping("/deletegaip")
   public String deleteGaip(HttpSession session, String mname) {
	   int unum = (int) session.getAttribute("unum");
       moimService.deleteGaip(unum, mname);
       return "success";
   }
   @ResponseBody
   @GetMapping("acceptgaip")
   public String acceptGaip(int unum, String mname) {
	   
	   moimService.acceptGaip(unum, mname);
	   
	   return "success";
   }
   @ResponseBody
   @GetMapping("deniedgaip")
   public String deniedGaip(int unum, String mname) {
	   
	   moimService.deniedGaip(unum, mname);
	   
	   return "success";
   }
   @ResponseBody
   @GetMapping("moimout")
   public String moimOut(String mname, int unum) {
	   
	   moimService.deniedGaip(unum, mname);
	   
	   return "success";
   }
    
}
