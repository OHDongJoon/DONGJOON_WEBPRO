package com.lec.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j   // 로그메세지 출력 용도
public class HelloController { 
	//@RequestMapping(value="/", method = RequestMethod.GET) 겟방식 사용할때 가능
	@GetMapping("/")
	public String index() {
		return "index";  // resources / templates / index.html
	}
	//@RequestMapping (value="/home", method = RequestMethod.GET) 겟방식 사용할때 가능
	@GetMapping("/home")
	public String home(Model model) {
		log.info("방가방가 첫 로그 메세지");
		model.addAttribute("greeting", "Hello, Spring, Boot!");
		return "home"; // resources / templates/home.html
	}
	
}
