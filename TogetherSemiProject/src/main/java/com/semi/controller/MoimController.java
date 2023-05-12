package com.semi.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.MoimDto;
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
		   String city1,String city2)
   			{   		   	       
	   		
	   		
	   		if(session.getAttribute("unum")==null) {
	   			int unum=0;
	   			UserDto udto = cityService.getDetailbyunum(unum);
	   			model.addAttribute("unum", unum);
				model.addAttribute("udto", udto);
	   		}else {
	   			int unum=(int)session.getAttribute("unum");
	   			UserDto udto = cityService.getDetailbyunum(unum);
	   			model.addAttribute("unum", unum);
				model.addAttribute("udto", udto);
	   		}
	      
	   		// 게시물의 총 글 갯수
			int totalCount = moimService.getTotalCount(category,city1,city2);
			
			int totalPage;// 총페이지수
			int perPage = 6;// 한페이지당 보여질 글의 갯수
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
			List<MoimDto> list = moimService.getPagingList(startNum, perPage, category, city1, city2);
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
			
			
   return "/main/moim/moimlist";
   }
   
   @GetMapping("/moimdetail")
   private String moimdetail(int mnum, Model model,HttpSession session)
   {
	 
	  //dto얻기
	  MoimDto dto=moimService.getData(mnum);
	  //model
	  System.out.println("detail");
	  if (session.getAttribute("unum") != null) {
	  int unum = (int)session.getAttribute("unum");
	  boolean pressChk = moimService.pressJjim(unum, mnum);
	  boolean pressGaipChk = moimService.pressGaip(unum, mnum);
	  model.addAttribute("pressChk", pressChk);
	  model.addAttribute("pressGaipChk", pressGaipChk);		
	  }  
	  List<Map<String, Object>> list = moimService.getGaipmemberList(mnum);
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
	public String insert(MoimDto dto,MultipartFile upload)
	{
		//네이버 클라우드의 버켓에 사진 업로드하기
		String photo=storageService.uploadFile(bucketName, "moim", upload);
		//반환된 암호화된 파일명을 dto에 넣기
		dto.setMphoto(photo);
		
		//db insert
		moimMapper.insertMoim(dto);
		return "redirect:moimlist";
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
	   System.out.println("1");
       moimService.deleteJjim(unum, mnum);
       return "success";
   }
   @ResponseBody
   @GetMapping("/moimgaip")
   public String moimgaip(HttpSession session, int mnum) {
	   int unum = (int) session.getAttribute("unum");
       moimService.moimGaip(unum, mnum);
       return "success";
   }
   @ResponseBody
   @GetMapping("/deletegaip")
   public String deleteGaip(HttpSession session, int mnum) {
	   int unum = (int) session.getAttribute("unum");
       moimService.deleteGaip(unum, mnum);
       return "success";
   }
    
}

