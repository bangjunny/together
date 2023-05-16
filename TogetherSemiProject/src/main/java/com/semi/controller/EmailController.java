package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.service.EmailService;

@Controller
public class EmailController {

	@Autowired
	EmailService emailService;
	
	@GetMapping("/inemail")
	@ResponseBody
	public void suEmail(String inemail)
	{
		System.out.println(inemail);
		
		String code = String.valueOf((int) (Math.random() * (999999 * 100000 * 1) * 100000));
		emailService.suEmail(inemail, code);
		
	}
	
}
