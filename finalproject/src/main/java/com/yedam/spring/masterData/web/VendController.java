package com.yedam.spring.masterData.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.masterData.service.VendService;
import com.yedam.spring.masterData.service.VendVO;

@Controller
public class VendController {

	@Autowired
	VendService vendService;

	// 전체조회
	@GetMapping("/vendList")
	public String getVendAllList(Model model) {
		model.addAttribute("vendList", vendService.getVendAll());
		model.addAttribute("vendInCd", vendService.getVendInCd().getVendCd());
		model.addAttribute("vendOutCd", vendService.getVendOutCd().getVendCd());
		return "vend/vendList";
	}

	// 등록
	@PostMapping("/vendInsert")
	public String vendInsertProcess(VendVO vendVO) {
		vendService.insertVend(vendVO);
		return "redirect:vendList";
	}

	// 삭제
	@PostMapping("/vendDelete")
	@ResponseBody
	public String vendDeleteProcess(HttpServletRequest request) {
		String[] arr = request.getParameterValues("valueArr");
		if (arr == null) {
			return "error";
		}
		for (int i = 0; i < arr.length; i++) {
			vendService.deleteVend(arr[i]);
		}
		return "success";
	}
	
	// 검색조회
	@GetMapping("/searchVend")
	@ResponseBody
	public List<VendVO> searchVend(VendVO vo) {
	    return vendService.getSerarchVend(vo);
	}
	
	// 수정
	@PostMapping("/updateVend")
	@ResponseBody
	public String updateVend(VendVO vo) {
		vendService.updateVend(vo);
        return "success";
	}
	
	// 거래처 디테일
	@PostMapping("vendDetail")
	@ResponseBody
	public VendVO vendDetailForm(VendVO vo) {
		return vendService.getVendDetail(vo);
	}
}
