package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

       @GetMapping("/logout")
       public String logoutPage() {
          return "/main/login/logout";
       }   
   
       @GetMapping("/join")
       public String newLoginPage() {
          return "/main/login/join";
       }   
       @GetMapping("/newmember")
       public String userJoinPage() {
          return "/main/login/newmember";
       }   
       
       
   
   
}