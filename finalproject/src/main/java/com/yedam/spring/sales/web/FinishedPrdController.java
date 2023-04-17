package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.FinishedPrdService;
import com.yedam.spring.sales.service.FinishedPrdVO;

@Controller
public class FinishedPrdController {
	@Autowired
	FinishedPrdService finishedprdService;
	
	@GetMapping("finishedPrd")
	public String finishedPrdList(Model model){
		model.addAttribute("finishedPrdList", finishedprdService.finishedPrdAllList());
		return "sales/finishedPrd";
	}
	
	@GetMapping("searchFinishedPrd")
	@ResponseBody
	public List<FinishedPrdVO> searchFinishedPrd(FinishedPrdVO vo){
		return finishedprdService.searchFinishedPrd(vo);
	}
}
