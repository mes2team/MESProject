package com.yedam.spring.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.spring.eqm.service.EqmService;
import com.yedam.spring.eqm.service.EqmVO;

@Controller
public class EqmController {
	@Autowired
	EqmService service;
	
	//설비전체조회
	@GetMapping("/eqm")
	public String eqm(Model model) {
		model.addAttribute("eqmList",service.selectEqmList());
		return "eqm/eqm";
	}
	
	//설비등록
	@PostMapping("/eqm")
	public String insertEqm(EqmVO eqmVO) {
		service.insertEqm(eqmVO);
		return "redirect:eqm";
	}
	
}
