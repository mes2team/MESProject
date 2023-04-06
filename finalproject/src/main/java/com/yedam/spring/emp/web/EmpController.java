package com.yedam.spring.emp.web;

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
import com.yedam.spring.emp.service.EmpService;
import com.yedam.spring.emp.service.EmpVO;

@Controller
public class EmpController {
	@Autowired
	EmpService empService;
	
	//조회(데이터, 일반페이지) -> GET
	//등록, 수정, 삭제 -> POST
	
	//전체조회 + 페이징
	//1) 페이징 필요한 페이지
	@GetMapping("/empList")
	public String getEmpAllList(Criteria cri, Model model) {
		//2) 총 데이터 개수 구하기
		int total = empService.getEmpAll();
		//3) 기본 값 10개 기준으로 데이터 가져오기
		model.addAttribute("empList",empService.getEmpAll(cri));
		//4) 페이지 개수와 이전, 이후 버튼 여부
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		// 5) 해당 페이지 이동
		return "user/empList";
	}
	//조건조회
	@GetMapping("/empInfo")
	public String getEmp(EmpVO empVO, Model model) {
		model.addAttribute("empInfo",empService.getEmp(empVO));
		return "user/empInfo";
	}
	//등록 - form이동
	@GetMapping("/empInsert")
	public String empInsertForm() {
		return "admin/empInsert";
	}
	//등록 - Process
	@PostMapping("/empInsert")
	public String empInsertProcess(EmpVO empVO, RedirectAttributes rrtt) {
		int empId = empService.insertEmp(empVO);
		String result = null;
		if(empId == -1) {
			result = "정상적으로 등록되지 않았습니다.";
		} else {
			result = "정상적으로 등록되었습니다."
					 +"\n등록된 사원의 사번은 " + empId + " 입니다.";
		}
		//주로 메세지 전달때 사용
		rrtt.addFlashAttribute("result",result);
		//전체조회 컨트롤러 요청
		return "redirect:empList";
	}
	//수정 - process /
	//비동기식 - JSON반환 방식 (굳이 써보는것)
	//1) client - JSON -> Server
	//2) Server - text -> Client
	@PostMapping("/empUpdate")
	@ResponseBody
	public Map<String, String> empUpdateProcess(@RequestBody EmpVO empVO) {
		return empService.updateEmp(empVO);
	}
	@PostMapping("/empDelete")
	@ResponseBody
	public String empDeleteProcess(@RequestParam int employeeId) {
		Map<String, String> map = empService.deleteEmp(employeeId);
		return map.get("결과");
	}
	
}
