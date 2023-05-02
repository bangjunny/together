package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping({"/","/home1"})
	public String home1()
	{
		return "/main";//tiles.xml에 이 이름으로 정의된 definition이 적용됨
	}
	
	@GetMapping("/home2")
	public String home2()
	{
		return "/sub";
	}
}
