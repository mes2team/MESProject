package com.yedam.spring.prcsInsp.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.eqm.service.EqmService;
import com.yedam.spring.prcsInsp.service.PrcsInspService;
import com.yedam.spring.prcsInsp.service.PrcsInspVO;

@Controller
public class PrcsInspController {
	@Autowired
	PrcsInspService service;
	@Autowired
	EqmService eqmService;

	// prcsInsp페이지로
	@GetMapping("/prcsInsp")
	public String prcsInspPage(Model model) {
		model.addAttribute("maxChkCd", service.selectMaxChkCd());
		model.addAttribute("empList", eqmService.selectEmpList());
		return "prcsInsp/prcsInsp";
	}

	// 모달에 검사해야할 공정목록
	@GetMapping("/selectPrcsList")
	@ResponseBody
	public List<PrcsInspVO> selectPrcsList() {
		return service.selectPrcsList();
	}

	// 공정별 검사기준
	@GetMapping("/selectPrcsStd")
	@ResponseBody
	public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd) {
		return service.selectPrcsStd(prcsCd);
	}

	// 검사완료
	@PostMapping("/chkDone")
	@ResponseBody
	public String chkDone(@RequestBody PrcsInspVO[] list) {
		for (int i = 0; i < list.length; i++) {

			if ("PRCS5000".equals(list[0].getPrcsCd())) { //indica 생산완료 바꾸고
				service.updateIndiPlan(list[0]);		  //plan모두 완료라면 생산완료 바꾸기	
			}

			if (i != list.length - 1) { //리스트의 맨 끝 빼고는 prcs_insp_dtl에 담아야 돼서
				service.insertDtl(list[i]);
			} else if (i == list.length - 1) {

				service.inferUpdateInsert(list[i]); //불량 저장
			}
		}
		return "success";
	}

	// 검사완료 전체리스트
	@GetMapping("/selectCompletedList")
	@ResponseBody
	public List<PrcsInspVO> selectCompletedList() {
		return service.selectCompletedPrcs();
	}

	@GetMapping("/inspDtl")
	@ResponseBody
	public List<PrcsInspVO> inspDtl(PrcsInspVO prcsCd) {
		return service.inspDtl(prcsCd);
	}

	// 검사완료 삭제
	@PostMapping("/deleteCompleted")
	@ResponseBody
	public String deleteCompleted(@RequestBody String[] deleteList) {
		for (int i = 0; i < deleteList.length; i++) {
			service.deleteCompleted(deleteList[i]);
		}
		return "deleteSuccess";
	}

}
