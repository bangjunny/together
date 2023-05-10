package com.semi.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;
import com.semi.mapper.CityMapper;
import com.semi.service.CityService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/city")
public class CityController {

	@Autowired
	CityMapper cityMapper;

	@Autowired
	private CityService cityService;

	@Autowired
	private NcpObjectStorageService storageService;
	private String bucketName = "together-bucket-104";

	@GetMapping("/list")
	public String list(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session,
			String city1, String city2) {
		System.out.println("검색하려는 city1:" + city1);
		System.out.println("검색하려는 city2:" + city2);
		if (city1 == null) { //검색값이 없을때
			if (session.getAttribute("unum") == null) { //비회원일때
				int unum = 0;
				UserDto udto = cityService.getDetailbyunum(unum);
				city1 = udto.getCity1();
				city2 = udto.getCity2();
				int totalCount = cityService.getAllTotalCountCity();// 게시판의 총 글 갯수
				int totalPage;// 총 페이지수
				int perPage = 5;// 한 페이지당 보여질 글 갯수
				int perBlock = 2;// 한 블럭당 보여질 페이지의 갯수
				int startNum;// 각 페이지에서 보여질 글의 시작번호
				int startPage;// 각 블럭에서 보여질 시작 페이지 번호
				int endPage;// 각 블럭에서 보여질 끝 페이지 번호
				int no;// 글 출력시 출력할 시작번호
				// 총 페이지수
				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);// 딱 떨어지면 0을 더하고 나머지가 있으면 1(페이지)을
																						// 더해준다
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
				List<CityBoardDto> list = cityService.getAllCityPagingList(startNum, perPage);
				// 출력시 필요한 변수들을 model에 모두 저장
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("list", list);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);

				model.addAttribute("udto", udto);
				model.addAttribute("unum", unum);
				model.addAttribute("city1", city1);
				model.addAttribute("city2", city2);
			} else {
				int unum = (int) session.getAttribute("unum");
				UserDto udto = cityService.getDetailbyunum(unum);
				city1 = udto.getCity1();
				city2 = udto.getCity2();
        
				int totalCount = cityService.getTotalCountCity(city1, city2);// 게시판의 총 글 갯수
				int totalPage;// 총 페이지수
				int perPage = 5;// 한 페이지당 보여질 글 갯수
				int perBlock = 2;// 한 블럭당 보여질 페이지의 갯수
				int startNum;// 각 페이지에서 보여질 글의 시작번호
				int startPage;// 각 블럭에서 보여질 시작 페이지 번호
				int endPage;// 각 블럭에서 보여질 끝 페이지 번호
				int no;// 글 출력시 출력할 시작번호
				// 총 페이지수
				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);// 딱 떨어지면 0을 더하고 나머지가 있으면 1(페이지)을
																						// 더해준다
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

				List<CityBoardDto> list = cityService.getCityPagingList(startNum, perPage, city1, city2);
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("list", list);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);

				model.addAttribute("udto", udto);
				model.addAttribute("unum", unum);
				model.addAttribute("city1", city1);
				model.addAttribute("city2", city2);
			}

		} else { //검색값이 있을때
			if (session.getAttribute("unum") == null) { //비회원일때
				int unum = 0;
				UserDto udto = cityService.getDetailbyunum(unum);
				int totalCount = cityService.getTotalCountCity(city1, city2);
				int totalPage;// 총 페이지수
				int perPage = 5;// 한 페이지당 보여질 글 갯수
				int perBlock = 2;// 한 블럭당 보여질 페이지의 갯수
				int startNum;// 각 페이지에서 보여질 글의 시작번호
				int startPage;// 각 블럭에서 보여질 시작 페이지 번호
				int endPage;// 각 블럭에서 보여질 끝 페이지 번호
				int no;// 글 출력시 출력할 시작번호
				// 총 페이지수
				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);// 딱 떨어지면 0을 더하고 나머지가 있으면 1(페이지)을
																						// 더해준다
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
				List<CityBoardDto> list = cityService.getCityPagingList(startNum, perPage, city1, city2);
				// 출력시 필요한 변수들을 model에 모두 저장
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("list", list);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);

				model.addAttribute("udto", udto);
				model.addAttribute("unum", unum);
				model.addAttribute("city1", city1);
				model.addAttribute("city2", city2);
			} else {//회원일때
				int unum = (int) session.getAttribute("unum");
				UserDto udto = cityService.getDetailbyunum(unum);

				int totalCount = cityService.getTotalCountCity(city1, city2);// 게시판의 총 글 갯수
				int totalPage;// 총 페이지수
				int perPage = 5;// 한 페이지당 보여질 글 갯수
				int perBlock = 2;// 한 블럭당 보여질 페이지의 갯수
				int startNum;// 각 페이지에서 보여질 글의 시작번호
				int startPage;// 각 블럭에서 보여질 시작 페이지 번호
				int endPage;// 각 블럭에서 보여질 끝 페이지 번호
				int no;// 글 출력시 출력할 시작번호
				// 총 페이지수
				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);// 딱 떨어지면 0을 더하고 나머지가 있으면 1(페이지)을
																						// 더해준다
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

				List<CityBoardDto> list = cityService.getCityPagingList(startNum, perPage, city1, city2);
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("list", list);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("no", no);
				model.addAttribute("udto", udto);
				model.addAttribute("unum", unum);
				model.addAttribute("city1", city1);
				model.addAttribute("city2", city2);
			}
		}
		return "/main/city/citylist";
	}

//	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
//	@GetMapping("/searchlist")
//	@ResponseBody public List<CityBoardDto> search(String city1, String city2, Model model){
//		List<CityBoardDto> citylist = cityService.getCityList(city1, city2);
//		
//		System.out.println(city1);
//		System.out.println(city2);
//		System.out.println(citylist.size());
//		
//		return citylist;
//	}

	@GetMapping("/detail")
	public String detail(int cbnum, Model model, HttpSession session, @RequestParam(defaultValue = "0") int ref,
			@RequestParam(defaultValue = "0") int step, @RequestParam(defaultValue = "0") int depth) {
		CityBoardDto dto = cityService.getDetailbycbnum(cbnum);
		int unum = (int) session.getAttribute("unum");
		UserDto udto = cityMapper.getDetailbyunum(unum);
		int totalrenum = cityMapper.getReboardNum();

		List<CbReBoardDto> listcomment = cityService.getCommentByCbnum(cbnum);
		String precontent = cityService.preContent(dto);
		String nxtcontent = cityService.nxtContent(dto);
		String prenum = cityService.preNum(dto);
		String nxtnum = cityService.nxtNum(dto);
		String totalComment = cityService.getTotalComment(cbnum);
		System.out.println("댓글 수" + totalComment);

		model.addAttribute("listcomment", listcomment);

		String city1 = dto.getCity1();
		String city2 = dto.getCity2();
		int totalCountCity = cityService.getTotalCountCity(city1, city2);
		model.addAttribute("udto", udto);
		model.addAttribute("dto", dto);
		model.addAttribute("nxtcontent", nxtcontent);
		model.addAttribute("nxtnum", nxtnum);
		System.out.println(nxtcontent);
		model.addAttribute("precontent", precontent);
		model.addAttribute("prenum", prenum);
		System.out.println(precontent);
		model.addAttribute("totalCountCity", totalCountCity);
		model.addAttribute("totalComment", totalComment);
		model.addAttribute("totalrenum", totalrenum);

		model.addAttribute("ref", ref);
		model.addAttribute("step", step);
		model.addAttribute("depth", depth);
		model.addAttribute("sessionunum", unum);

		return "/main/city/CityDetail";
	}

	@GetMapping("/cityform")
	public String cityform(int unum, String city1, String city2, Model model) {
		UserDto dto = cityService.getDetailbyunum(unum);
		String uname = dto.getUname();
		model.addAttribute("dto", dto);
		model.addAttribute("city1", city1);
		model.addAttribute("city2", city2);
		model.addAttribute("uname", uname);
		return "/main/city/cityform";
	}

	@PostMapping("/cityinsert")
	public String cityinsert(CityBoardDto dto, MultipartFile upload) {
		String photo = storageService.uploadFile(bucketName, "city", upload);
		dto.setCbphoto(photo);
		int cbnum = dto.getCbnum();
		System.out.println("사진" + photo);
		System.out.println(cbnum);

		cityService.insertCity(dto);

		return "redirect:list";
	}

	@PostMapping("/newcomment")
	public String newcomment(
			int cbnum,
			CbReBoardDto dto,
			Model model)
	{
		cityService.newComment(dto);
		
		model.addAttribute("cbnum",cbnum);
		
		return "redirect:/city/detail?cbnum="+dto.getCbnum();
	}

	@PostMapping("/addcomment")
	public String addcomment(
			CbReBoardDto dto,
			Model model)
	{
		CbReBoardDto rdto=new CbReBoardDto();
		int renum=dto.getRenum();
		CbReBoardDto crdto=cityMapper.getCommentByRenum(renum);
		int ref=crdto.getRef();
		int step=crdto.getStep();
		int depth=crdto.getDepth();
		
		//System.out.println("sfff"+depth);
		model.addAttribute("ref",ref);
		model.addAttribute("step",step);
		model.addAttribute("depth",depth);
		
		cityService.addComment(dto);
		
		return "redirect:/city/detail?cbnum="+dto.getCbnum();
	}

	@GetMapping("/newPost")
	public String newPost() {
		return "/main/city/newPost";
	}

	@GetMapping("/delete")
	public String delete(int cbnum) {
		String filename = cityService.getDetailbycbnum(cbnum).getCbphoto();
		storageService.deleteFile(bucketName, "city", filename);
		cityService.deleteCityboard(cbnum);
		return "redirect:/city/list";
	}
	
	@PostMapping("/updatecomment")
	public String updateComment(
			CbReBoardDto dto
			) {
		cityService.updateComment(dto);
		int cbnum=dto.getCbnum();
		
		return "redirect:/city/detail?cbnum="+cbnum;
	}


//<-----------------------------------절취선-------------------------------------------->

	@GetMapping("/cityupdateform")
	public String cityupdateform(int cbnum, Model model) {
		System.out.println(cbnum);
		CityBoardDto cbdto = cityService.getDetailbycbnum(cbnum);
		int unum = cbdto.getUnum();
		UserDto udto = cityService.getDetailbyunum(unum);
		model.addAttribute("cbdto", cbdto);
		model.addAttribute("udto", udto);
		return "/main/city/cityupdateform";
	}

	@GetMapping("/cityupdate")
	public String cityupdate(CityBoardDto dto, MultipartFile upload) {

		return "/main/city/CityDetail";
	}

}
