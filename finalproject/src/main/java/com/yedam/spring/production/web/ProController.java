package com.yedam.spring.production.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProService;

@Controller
public class ProController {

	@Autowired
	ProService proService;
	//생산계획 페이지 이동
	@GetMapping("/productionPlan")
	public String proPlanPage(Model model) {
		return"production/productionplan";
	}
	// 생산계획 등록처리
	@PostMapping("/newPlanInsert")
	public String empInsertProc(ProPlanVO vo) {
		// 커맨드객체
		return "rediect:";
	}
}
