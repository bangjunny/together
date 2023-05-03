package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.dto.MoimDto;
import com.semi.service.MoimService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/moim")
public class MoimController {
   
   @Autowired
   private MoimService moimService;
   
   @Autowired
   private NcpObjectStorageService storageService;
   
   @GetMapping("/moimlist")
   private String moimlist()
   {   
	   
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
   
}

