package com.yedam.spring.prdtInsp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.prdtInsp.service.PrdtInspService;

@Controller
public class PrdtInspController {
	@Autowired
	PrdtInspService service;
	//prdtInsp페이지로
	@GetMapping("/prdtInsp") 
	public String prdtInspPage(Model model) { 
		model.addAttribute("orderList",service.selectOrderList());
		model.addAttribute("maxLot",service.selectMaxEdctsLotNo());
		
		return "prdtInsp/prdtInsp";
    }
}
