package com.semi.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.mapper.LoginMapper;
import com.semi.mapper.MoimMapper;
import com.semi.service.CityService;
import com.semi.service.MoimService;


@Controller
public class MapController {
	@Autowired
	MoimMapper moimMapper;

	@Autowired
	CityService cityService;
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	MoimService moimService;
	
	@GetMapping("/mapcontact")
	public String mapcontact(MoimDto dto,Model model,String category,String city1,String city2,HttpSession session)
	{
		int unum = dto.getUnum();
		if (session.getAttribute("unum") == null) {
			unum = 0;
			
		} else {
			unum = (int) session.getAttribute("unum");
		}
		UserDto udto = cityService.getDetailbyunum(unum);
		model.addAttribute("unum", unum);
		model.addAttribute("udto", udto);
		model.addAttribute("dto",dto);
		if (city1 == null && category == null && session.getAttribute("unum") != null) {
			category = udto.getCategory();
			city1 = udto.getCity1();
			city2 = udto.getCity2();
		}
		model.addAttribute("category", category);
		model.addAttribute("city1", city1);
		model.addAttribute("city2", city2);
		
		
		return "/main/contact/mapcontact";
	}
}
