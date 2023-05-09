package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home1()
	{
		//tiles.xml에 이 이름으로 정의된 definition이 적용됨
		return "/sub";
	}
}
