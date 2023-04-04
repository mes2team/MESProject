package com.yedam.spring.mat.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.common.PageDTO;
import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.mat.service.MatService;

@Controller
public class MatController {
	@Autowired
	MatService matService;
	
	//조회(데이터, 일반페이지) -> GET
	//등록, 수정, 삭제 -> POST
	
	//전체조회 + 페이징
	//1) 페이징 필요한 페이지
	@GetMapping("/matList")
	public String getMatAllList(Criteria cri, Model model) {
		//2) 총 데이터 개수 구하기
		int total = matService.getMatAll();
		//3) 기본 값 10개 기준으로 데이터 가져오기
		model.addAttribute("matList",matService.getMatAll(cri));
		//4) 페이지 개수와 이전, 이후 버튼 여부
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		System.out.println(new PageDTO(cri,total));
		// 5) 해당 페이지 이동
		return "material/matList";
	}
	//조건조회
	@GetMapping("/matInfo")
	public String getMat(MatVO matVO, Model model) {
		model.addAttribute("matInfo",matService.getMat(matVO));
		return "material/matInfo";
	}
	//등록 - form이동
	@GetMapping("/matInsert")
	public String matInsertForm() {
		return "material/matInsert";
	}
	//등록 - Process
	@PostMapping("/matInsert")
	public String matInsertProcess(MatVO matVO, RedirectAttributes rrtt) {
		int matId = matService.insertMat(matVO);
		String result = null;
		if(matId == -1) {
			result = "정상적으로 등록되지 않았습니다.";
		} else {
			result = "정상적으로 등록되었습니다."
					 +"\n등록된 사원의 사번은 " + matId + " 입니다.";
		}
		//주로 메세지 전달때 사용
		rrtt.addFlashAttribute("result",result);
		//전체조회 컨트롤러 요청
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
	@PostMapping("/matDelete")
	@ResponseBody
	public String matDeleteProcess(@RequestParam String rscCd) {
		Map<String, String> map = matService.deleteMat(rscCd);
		return map.get("결과");
	}
	
}
