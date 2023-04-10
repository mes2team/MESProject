package com.yedam.spring.mat.web;

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

import com.yedam.spring.mat.service.MatService;
import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.vend.service.VendVO;

@Controller
public class MatController {
	@Autowired
	MatService matService;
	
	//조회(데이터, 일반페이지) -> GET
	//등록, 수정, 삭제 -> POST
	
	//전체조회
	//1) 페이징 필요한 페이지
	@GetMapping("/matList")
	public String getMatAllList(Model model) {
		model.addAttribute("matList",matService.matList());
		return "material/matList";
	}
	//조건조회
	@GetMapping("/matInfo")
	@ResponseBody
	public MatVO getMat(MatVO matVO, Model model) {
		model.addAttribute("matInfo",matService.getMat(matVO));
		matVO = matService.getMat(matVO);
		return matVO; 
	}
	//등록 - form이동
//	@GetMapping("/matInsert")
//	public String matInsertForm() {
//		return "material/matInsert";
//	}
	//등록 - Process
	@PostMapping("/matInsert")
	public String matInsertProcess(MatVO matVO) {
		matService.insertMat(matVO);
		return "redirect:matList";
	}
	//수정 - process /
	//비동기식 - JSON반환 방식 (굳이 써보는것)
	//1) client - JSON -> Server
	//2) Server - text -> Client
	@PostMapping("/matUpdate")
	@ResponseBody
	public Map<String, String> matUpdateProcess(@RequestBody MatVO matVO) {
		return matService.updateMat(matVO);
	}
	//삭제
	@PostMapping("/matDelete")
	@ResponseBody
	public String matDeleteProcess(@RequestParam String rscCd) {
		Map<String, String> map = matService.deleteMat(rscCd);
		return map.get("결과");
	}
	
	//자재발주 전체목록
	@GetMapping("/matOrder")
	public String getMatOrderList(Model model) {
		model.addAttribute("matOrderList",matService.matOrderList());
		model.addAttribute("matStock",matService.matStock());
		return "material/matOrder";
	}
	// 등록
		@PostMapping("/matOrderInsert")
		public String vendInsertProcess(MatVO matVO) {
			matService.addMatOrderInfo(matVO);
			return "redirect:matOrder";
		}
	// 수정
	@PostMapping("/updatematOrder")
	@ResponseBody
	public Map<String, Object> updatematOrder(@RequestBody MatVO[] arr) {
		Map<String, Object> map = new HashMap<>();
	    if (arr == null) {
	    	map.put("result", "false");
	    	map.put("data", null);
	        return map;
	    }
	    for (int i = 0; i < arr.length; i++) {
	    	matService.updatematOrder(arr[i]);
	    }
	    
	    List<MatVO> list = matService.matOrderList();
	    map.put("result", "success");
    	map.put("data", list);
        return map;
	}
	
	//삭제
	@PostMapping("/matOrderDelete")
	@ResponseBody
	public String matOrderDeleteProcess(HttpServletRequest request) {
		String[] arr = request.getParameterValues("valueArr");
		if (arr == null) {
			return "error";
		}
		for (int i = 0; i < arr.length; i++) {
			matService.removeMatOrder(arr[i]);
		}
		return "success";
	}
	

}
