package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MapController {
	@GetMapping("/mapcontact")
	public String mapcontact()
	{
		return "/main/contact/mapcontact";
	}
}
