package com.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;
import com.semi.mapper.CityMapper;
import com.semi.service.CityService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/city")
public class CityController {

	@Autowired
	private CityService cityService;

	@Autowired
	private NcpObjectStorageService storageService;
	private String bucketName="together-bucket-104";

	@GetMapping("/list")
	public String list(
			 /**@RequestParam(defaultValue = "1") int currentPage**/
			Model model) {

		/**
		int totalCount = cityService.getTotalCountCity();// 게시판의 총 글 갯수
		int totalPage;// 총 페이지수
		int perPage = 10;// 한 페이지당 보여질 글 갯수
		int perBlock = 5;// 한 블럭당 보여질 페이지의 갯수
		int startNum;// 각 페이지에서 보여질 글의 시작번호
		int startPage;// 각 블럭에서 보여질 시작 페이지 번호
		int endPage;// 각 블럭에서 보여질 끝 페이지 번호
		int no;// 글 출력시 출력할 시작번호

		// 총 페이지수
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);// 딱 떨어지면 0을 더하고 나머지가 있으면 1(페이지)을 더해준다
		// 시작 페이지
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		// 끝페이지
		endPage = startPage + perBlock - 1;
		// 이때 문제점 ... endPage가 totalPage보다 크면 안된다
		if (endPage > totalPage)
			endPage = totalPage;

		// 각 페이지의 시작번호(1페이지:0, 2페이지:3, 3페이지:6...)
		startNum = (currentPage - 1) * perPage;
		// 각 글마다 출력할 글 번호(예:10개일경우 1페이지:10, 2페이지:7...)
		no = totalCount - startNum;

		// 각 페이지에 필요한 게시글 db에서 가져오기
		List<CityBoardDto> list = cityService.getPaginlistCity(startNum, perPage); // 출력시 필요한 변수들을 model에 모두 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("no", no);
		**/
		
		int unum=2;
		int totalCountCity=cityService.getTotalCountCity();
		List<CityBoardDto> listcity = cityService.getAllCity();
		
		UserDto udto =  cityService.getDetailbyunum(unum);
		
		model.addAttribute("totalCountCity",totalCountCity);
		model.addAttribute("listcity",listcity);
		model.addAttribute("unum",unum);
		model.addAttribute("udto",udto);
	

		return "/main/city/citylist";
		
	}
	@GetMapping("/detail")
	public String detail(
			int cbnum, Model model
	) {
		CityBoardDto dto = cityService.getDetailbycbnum(cbnum);
		String precontent=cityService.preContent(cbnum);
		String nxtcontent=cityService.nxtContent(cbnum);
		int totalCountCity=cityService.getTotalCountCity();
		
		model.addAttribute("dto",dto);
		model.addAttribute("nxtcontent",nxtcontent);
		System.out.println(nxtcontent);
		model.addAttribute("precontent",precontent);
		System.out.println(precontent);
		model.addAttribute("totalCountCity",totalCountCity);
		
		return "/main/city/CityDetail";
	}
	
	
	@GetMapping("/cityform")
	public String cityform(
			int unum, Model model
	) {
		UserDto dto = cityService.getDetailbyunum(unum);
		model.addAttribute("dto",dto);
		
		return "/main/city/cityform";
	}
	
	@PostMapping("/cityinsert")
	public String cityinsert(
			CityBoardDto dto, MultipartFile upload
	) {
		
		
		
		
		
		cityService.insertCity(dto);
		return "redirect:list";
	}
	
	

}
