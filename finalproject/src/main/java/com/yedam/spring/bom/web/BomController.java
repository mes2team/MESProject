package com.yedam.spring.bom.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.bom.service.BomService;
import com.yedam.spring.production.service.ProService;

@Controller
public class BomController {
	@Autowired
	BomService bomService;
	
	@Autowired
	ProService proService;
	
	@GetMapping("bomList")
	public String bomListForm(Model model) {
		model.addAttribute("proList", proService.getprdtInfo());
		return "bom/bomList";
	}
}
