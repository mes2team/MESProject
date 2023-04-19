package com.yedam.spring.eqm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.spring.eqm.service.EqmService;
import com.yedam.spring.eqm.service.EqmVO;

@Controller
public class EqmController {
	@Autowired
	EqmService service;

	// 설비페이지 ,설비 전체조회, 사원조회(담당자용)
	@GetMapping("/eqm")
	public String eqm(Model model) {
		model.addAttribute("eqmList", service.selectEqmList());
		model.addAttribute("maxCdList", service.selectMaxCd());
		model.addAttribute("empList",service.selectEmpList());
		return "eqm/eqm";
	}

	// 설비등록
	@PostMapping("/eqm")
	public String insertEqm(EqmVO eqmVO,MultipartFile file) throws Exception{
		service.insertEqm(eqmVO);
		return "redirect:eqm";
	}

	// 설비단건조회
	@GetMapping("/eqmDetail")
	@ResponseBody // 화면이 아닌 데이터 넘길 땐 요거 써야됨 jsp에서 dataType=json받기위해
	public EqmVO eqmDetail(EqmVO eqmVO) {
		return service.selectEqm(eqmVO);
	}

	// 설비삭제
	@PostMapping("/deleteEqm")
	public String deleteEqm(EqmVO eqmVO) {
		service.deleteEqm(eqmVO);
		return "redirect:eqm";
	}

	// 설비수정
	@PostMapping("/updateEqm")
	public String updateEqm(EqmVO eqmVO) {
		service.updateEqm(eqmVO);
		return "redirect:eqm";
	}

	//////////////// 설비점검내역//////////////////
	@GetMapping("/eqmCheck")
	public String eqmCheckPage(Model model) {
		model.addAttribute("list", service.selectCheckList());
		model.addAttribute("eqmList", service.selectEqmList());
		model.addAttribute("managers", service.selectEmpList());
		return "eqm/eqmCheck";
	}

	
	  //점검검색조회
	  @GetMapping("/searchEqmCheck")
	  @ResponseBody public List<EqmVO> searchEqmCheck(EqmVO eqmVO){ 
	  	return service.searchEqmCheck(eqmVO);
	  }
	 

	// 점검단건조회
	@GetMapping("/selectCheck")
	@ResponseBody
	public EqmVO selectCheck(EqmVO eqmVO) {
		return service.selectCheck(eqmVO);
	}

	// 점검등록
	@PostMapping("/insertCheck")
	@ResponseBody
	public String insertCheck(EqmVO eqmVO) {
		service.insertCheck(eqmVO);
		return "insertSuccess";
	}

	// 점검삭제
	@PostMapping("/deleteCheck")
	@ResponseBody
	public String deleteCheck(@RequestBody String[] deleteList) {
		for (int i = 0; i < deleteList.length; i++) {
			service.deleteCheck(deleteList[i]);
		}
		return "Success";
	}

	// 점검수정
	@PostMapping("/updateCheck")
	@ResponseBody
	public String updateCheck(EqmVO eqmVO) {
		service.updateCheck(eqmVO);
		return "update success";
	}

	// 설비비가동

	// 설비비가동 화면 및 전체조회
	@GetMapping("/eqmOpr")
	public String eqmOpr(Model model) {
		model.addAttribute("OprList", service.selectOprList());
		model.addAttribute("managers",service.selectEmpList());
		return "eqm/eqmOpr";
	}

	// 비가동등록,Y업데이트
	@PostMapping("insertOpr")
	public String insertOprUpdateY(EqmVO eqmVO) {
		service.insertOprUpdateY(eqmVO);
		return "redirect:eqmOpr";
	}

	// 비가동삭제
	@PostMapping("/deleteOpr")
	@ResponseBody
	public String deleteOpr(@RequestBody String[] deleteList) {
		for (int i = 0; i < deleteList.length; i++) {
			service.deleteOpr(deleteList[i]);
		}
		return "Success";
	}
	
	//모달창 열면 최대코드랑 설비리스트 다시 
	@GetMapping("/oprModal")
	@ResponseBody
	public Map<String, Object> openModal(Model model){
		 Map<String, Object>  map = new HashMap<>();
		 map.put("maxNoprCd", service.selectMaxNoprCd());
		 map.put("YList", service.selectYList());
		return map;
	}
	
	//비가동수정
	@PostMapping("/updateOpr")
	public String updateOpr(EqmVO eqmVO) {
		service.updateOpr(eqmVO);
		return "redirect:eqmOpr"; //jsp에서 ajax result로페이지 못 받아서 리다이렉트 안 됨
								  // success부분에 그냥 location.reload()해주기	
	}
	

}
