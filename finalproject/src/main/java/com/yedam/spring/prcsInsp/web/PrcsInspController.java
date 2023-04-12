package com.yedam.spring.prcsInsp.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.prcsInsp.service.PrcsInspService;
import com.yedam.spring.prcsInsp.service.PrcsInspVO;

@Controller
public class PrcsInspController {
	@Autowired
	PrcsInspService service;
	//prdtInsp페이지로
	@GetMapping("/prcsInsp") 
	public String prcsInspPage() { 
		return "prcsInsp/prcsInsp";
    }
	
	@GetMapping("/selectPrcsList")
	@ResponseBody
	public List<PrcsInspVO> selectPrcsList(){
		return service.selectPrcsList();
	}
}
