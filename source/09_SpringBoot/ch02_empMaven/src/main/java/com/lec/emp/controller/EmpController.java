package com.lec.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.lec.emp.domain.Emp;
import com.lec.emp.service.EmpService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j  
public class EmpController {
	@Autowired
	private EmpService empservice;
	//@RequestMapping (value="/" , method = ReqeustnMethod.GET)
	@GetMapping("/")
	public String index() {
		log.info("welcome !");
		return "redirect:emp.do";
	}
	@GetMapping("emp.do")
	public String emp(@ModelAttribute("searchEmp") Emp searchEmp, Model model ) {
		model.addAttribute("empList" , empservice.empList(searchEmp));
		model.addAttribute("deptList", empservice.deptList());
		return "emp";
	}
}
