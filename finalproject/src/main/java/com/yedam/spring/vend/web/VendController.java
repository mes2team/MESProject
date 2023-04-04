package com.yedam.spring.vend.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.spring.vend.service.VendService;
import com.yedam.spring.vend.service.VendVO;

@Controller
public class VendController {
	
	@Autowired
	VendService vendService;
	
	//전체조회
	@GetMapping("/vendList")
	public String getVendAllList(Model model) {
		model.addAttribute("vendList", vendService.getVendAll());
		model.addAttribute("vendInCd", vendService.getVendInCd().getVendCd());
		model.addAttribute("vendOutCd", vendService.getVendOutCd().getVendCd());
		return "vend/vendList";
	}
	
	@PostMapping("/vendInsert")
	public String vendInsertProcess(VendVO vendVO) {
		vendService.insertVend(vendVO);
		return "redirect:vendList";
	}
}
