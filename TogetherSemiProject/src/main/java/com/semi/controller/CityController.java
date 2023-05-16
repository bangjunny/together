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
import com.semi.dto.CityPhotoDto;
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
			String city1, String city2, String keyword) {
		

		
		
		UserDto udto;
		int unum;
		
		if(city2=="지역전체" || city2==null) {
			city2="no";
		}

		if (session.getAttribute("unum") == null) { // 비회원일때
			unum = 0;
		} else {
			unum = (int) session.getAttribute("unum"); //회원일때
		}
		udto = cityService.getDetailbyunum(unum);
		if (city1==null) {
			city1 = udto.getCity1();
			city2 = udto.getCity2();
		}
		System.out.println("total city1:" + city1);
		System.out.println("total city2:" + city2);
		System.out.println("total keyword:" + keyword);

		int totalCount = cityService.getTotalCountCity(city1, city2, keyword);// 게시판의 총 글 갯수
		int totalPage;// 총 페이지수
		int perPage = 5;// 한 페이지당 보여질 글 갯수
		int perBlock = 2;// 한 블럭당 보여질 페이지의 갯수
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
		System.out.println("페이징 city1:" + city1);
		System.out.println("페이징 city2:" + city2);
		System.out.println("페이징 keyword:" + keyword);
		List<CityBoardDto> list = cityService.getCityPagingList(startNum, perPage, city1, city2, keyword);
		List<CityBoardDto> readlist = cityService.getCityPagingListReadTop(city1, city2, keyword);
		List<CityBoardDto> likelist = cityService.getCityPagingListLikeTop(city1, city2, keyword);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("readlist", readlist);
		model.addAttribute("likelist", likelist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("no", no);
		model.addAttribute("udto", udto);
		model.addAttribute("unum", unum);
		model.addAttribute("city1", city1);
		model.addAttribute("city2", city2);
		model.addAttribute("keyword", keyword);

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
			@RequestParam(defaultValue = "0") int step, @RequestParam(defaultValue = "0") int depth, String keyword) {

		cityService.updateReadcount(cbnum);
    	List<CityPhotoDto> pdto = cityService.getPhoto(cbnum);
		CityBoardDto dto = cityService.getDetailbycbnum(cbnum);
		int unum = (int) session.getAttribute("unum");
		UserDto udto = cityMapper.getDetailbyunum(unum);
		int totalrenum = cityMapper.getReboardNum();
		List<CbReBoardDto> listcomment = cityService.getCommentByCbnum(cbnum);
		CbReBoardDto rdto=new CbReBoardDto();
		
		String precontent = cityService.preContent(dto);
		String nxtcontent = cityService.nxtContent(dto);
		String prenum = cityService.preNum(dto);
		String nxtnum = cityService.nxtNum(dto);
		String totalComment = cityService.getTotalComment(cbnum);
		System.out.println("댓글 수" + totalComment);
		String photocount = cityService.getPhotoCount(cbnum);

		String city1 = dto.getCity1();
		String city2 = dto.getCity2();
		
		int cblikecheck = cityService.cblikecheck(unum, cbnum);
		model.addAttribute("cblikecheck",cblikecheck);		
		model.addAttribute("photocount",photocount);
		model.addAttribute("pdto",pdto);
		model.addAttribute("rdto",rdto);
		model.addAttribute("listcomment", listcomment);

		int totalCountCity = cityService.getTotalCountCity(city1, city2, keyword);
		model.addAttribute("udto", udto);
		model.addAttribute("dto", dto);
		model.addAttribute("nxtcontent", nxtcontent);
		model.addAttribute("nxtnum", nxtnum);
		//System.out.println(nxtcontent);
		model.addAttribute("precontent", precontent);
		model.addAttribute("prenum", prenum);
		//System.out.println(precontent);
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
	@ResponseBody void cityinsert(CityBoardDto dto, List<MultipartFile> upload) {
		//System.out.println("나오냐?");
		cityService.insertCity(dto);
		//System.out.println("너는 나오냐?");
		if(upload!=null) {
			for(MultipartFile file : upload)
			{
				String photoname=storageService.uploadFile(bucketName, "city", file);
				CityPhotoDto pdto=new CityPhotoDto();
				pdto.setCbnum(dto.getCbnum());
				pdto.setPhoto_idx(photoname);
				cityService.newCityPhoto(pdto);
			}
		}
		
	}

	@PostMapping("/newcomment")
	public String newcomment(int cbnum, CbReBoardDto dto, Model model) {
		cityService.newComment(dto);

		model.addAttribute("cbnum", cbnum);

		return "redirect:/city/detail?cbnum=" + dto.getCbnum();
	}

	@PostMapping("/addcomment")
	public String addcomment(CbReBoardDto dto, Model model) {
		CbReBoardDto rdto = new CbReBoardDto();
		int renum = dto.getRenum();
		CbReBoardDto crdto = cityMapper.getCommentByRenum(renum);
		int ref = crdto.getRef();
		int step = crdto.getStep();
		int depth = crdto.getDepth();

		// System.out.println("sfff"+depth);
		model.addAttribute("ref", ref);
		model.addAttribute("step", step);
		model.addAttribute("depth", depth);

		cityService.addComment(dto);

		return "redirect:/city/detail?cbnum=" + dto.getCbnum();
	}

	@GetMapping("/newPost")
	public String newPost() {
		return "/main/city/newPost";
	}

	@GetMapping("/delete")
	public String delete(int cbnum) {
	    cityService.deleteCityboard(cbnum);
	    return "redirect:/city/list";
	}

	@PostMapping("/updatecomment")
	public String updateComment(CbReBoardDto dto) {
		cityService.updateComment(dto);   
		int cbnum=dto.getCbnum();
		
		return "redirect:/city/detail?cbnum="+cbnum;
	}
	
	@GetMapping("/deleteComment")
	public String deleteComment(int renum, CbReBoardDto dto) {		
		
		cityService.deleteComment(renum);
		int cbnum=dto.getCbnum();
		
		return "redirect:/city/detail?cbnum="+cbnum;
	}

	@GetMapping("/cityupdateform")
	public String cityupdateform(int cbnum, Model model) {
		//System.out.println(cbnum);
		List<CityPhotoDto> pdto = cityService.getPhoto(cbnum);
		CityBoardDto cbdto = cityService.getDetailbycbnum(cbnum);
		int unum = cbdto.getUnum();
		UserDto udto = cityService.getDetailbyunum(unum);
		int size=pdto.size();
		System.out.println(size);
		
		model.addAttribute("size",size);
		model.addAttribute("pdto",pdto);
		model.addAttribute("cbdto", cbdto);
		model.addAttribute("udto", udto);
		return "/main/city/cityupdateform";
	}

	@PostMapping("/cityupdate")
	@ResponseBody public void cityupdate(
			int cbnum,
			CityBoardDto dto, 
			List<MultipartFile> upload, 
			String delcheck)
	{
		System.out.println("나옴?");
		System.out.println("사진 지워짐?"+delcheck);
		cityService.updateCity(dto);

		System.out.println("여긴 나옴?");
		if(upload!=null) {
			List<CityPhotoDto> originalPhotos = cityService.getPhoto(cbnum);
			for(CityPhotoDto photo : originalPhotos) {
				storageService.deleteFile(bucketName, "city", photo.getPhoto_idx());
				cityService.deleteCityPhoto(photo.getPhoto_idx());
			}
			for(MultipartFile file : upload)
			{
				CityPhotoDto pdto=new CityPhotoDto();
				String photoname=storageService.uploadFile(bucketName, "city", file);
				pdto.setCbnum(dto.getCbnum());
				pdto.setPhoto_idx(photoname);
				cityService.newCityPhoto(pdto);
			}
		}
		else if(upload==null &&"1".equals(delcheck)) {
			List<CityPhotoDto> originalPhotos = cityService.getPhoto(cbnum);
			for (CityPhotoDto photo : originalPhotos) {
	            storageService.deleteFile(bucketName, "city", photo.getPhoto_idx());
	            cityService.deleteCityPhoto(photo.getPhoto_idx());
	        }
		}
	
	}
	
	@ResponseBody
    @GetMapping("/cblike")
    public int cblike(int unum, int cbnum) {
       cityService.cblike(unum, cbnum);
       cityService.cblikecountplus(cbnum);
       CityBoardDto cdto = cityService.getDetailbycbnum(cbnum);
       int cblike=cdto.getCblike();
       return cblike;
    }
    @ResponseBody
    @GetMapping("/cbdislike")
    public int cbdislike(int unum, int cbnum) {
       cityService.cbdislike(unum, cbnum);
       cityService.cblikecountminus(cbnum);
       CityBoardDto cdto = cityService.getDetailbycbnum(cbnum);
       int cblike=cdto.getCblike();
       return cblike;
    }
	
}

