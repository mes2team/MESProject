package com.yedam.spring.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("maxCdList",service.selectMaxCd());
		return "eqm/eqm";
	}
	
	//설비등록
	@PostMapping("/eqm")
	public String insertEqm(EqmVO eqmVO) {
		service.insertEqm(eqmVO);
		return "redirect:eqm";
	}
	
	//설비단건조회
	@GetMapping("/eqmDetail")
	@ResponseBody //화면이 아닌 데이터 넘길 땐 요거 써야됨 jsp에서 dataType=json받기위해
	public EqmVO eqmDetail(EqmVO eqmVO) {
		return service.selectEqm(eqmVO);
	}
	
	//설비삭제
	@PostMapping("/deleteEqm")
	public String deleteEqm(EqmVO eqmVO) {
		service.deleteEqm(eqmVO);
		return "redirect:eqm";
	}
	
	//설비수정
	@PostMapping("/updateEqm")
	public String updateEqm(EqmVO eqmVO) {
		service.updateEqm(eqmVO);
		return "redirect:eqm";
	}
	////////////////설비점검내역//////////////////
	@GetMapping("/eqmCheck")
	public String eqmCheckPage(Model model) {
		model.addAttribute("list", service.selectCheckList());
		return "eqm/eqmCheck";
	}
	
}
