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
	//모달에 검사해야할 공정목록
	@GetMapping("/selectPrcsList")
	@ResponseBody
	public List<PrcsInspVO> selectPrcsList(){
		return service.selectPrcsList();
	}
	
	//공정별 검사기준
	@GetMapping("/selectPrcsStd")
	@ResponseBody
	public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd){
		return service.selectPrcsStd(prcsCd);
	}
	
}
