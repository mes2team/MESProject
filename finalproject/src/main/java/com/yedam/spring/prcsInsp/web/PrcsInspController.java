package com.yedam.spring.prcsInsp.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.prcsInsp.service.PrcsInspService;
import com.yedam.spring.prcsInsp.service.PrcsInspVO;

@Controller
public class PrcsInspController {
	@Autowired
	PrcsInspService service;
	//prcsInsp페이지로
	@GetMapping("/prcsInsp") 
	public String prcsInspPage(Model model) { 
		model.addAttribute("maxChkCd",service.selectMaxChkCd()) ;
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
	
	//검사완료 
	@PostMapping("/chkDone")
	@ResponseBody
	public String chkDone(@RequestBody PrcsInspVO[] list) {
		for(int i=0; i<list.length ;i++) {
			if(i != list.length-1) {
				service.insertDtl(list[i]);
			}else if(i == list.length-1) {
				
				service.inferUpdateInsert(list[i]);
			}
		}
		return "success";
	}
	
}
