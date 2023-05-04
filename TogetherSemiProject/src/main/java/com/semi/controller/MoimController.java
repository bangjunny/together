package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.MoimDto;
import com.semi.mapper.MoimMapper;
import com.semi.service.MoimService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/moim")
public class MoimController {
   
	@Autowired
	MoimMapper moimMapper;
	
	//버켓이름지정
	private String bucketName="together-bucket-104";
		
	@Autowired
	private NcpObjectStorageService storageService;
	
   @Autowired
   private MoimService moimService;
   
   @GetMapping("/moimlist")
   private String moimlist(Model model)
   {   
		//총 글갯수 출력
		int totalCount=moimMapper.getTotalCount();
		
		model.addAttribute("totalCount", totalCount);
	   
   return "/main/moim/moimlist";
   }
   
   @GetMapping("/moimdetail")
   private String moimdetail(int mnum,Model model)
   {
	  
	  //dto얻기
	  MoimDto dto=moimService.getData(mnum);
	  //model
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
}

