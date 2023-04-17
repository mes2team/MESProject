package com.yedam.spring.eqm.web;

import java.io.File;
import java.util.HashMap;
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
		
		  /*우리의 프로젝트경로를 담아주게 된다 - 저장할 경로를 지정*/
       // String projectPath = "/finalproject/src/main/webapp/resources/assets/img";

        /*식별자 . 랜덤으로 이름 만들어줌*/
        UUID uuid = UUID.randomUUID();

        /*랜덤식별자_원래파일이름 = 저장될 파일이름 지정*/
        String fileName = uuid + "_" + file.getOriginalFilename();
        /*빈 껍데기 생성*/
        /*File을 생성할건데, 이름은 "name" 으로할거고, projectPath 라는 경로에 담긴다는 뜻*/
        //File saveFile = new File(projectPath, fileName);
        
        //file.transferTo(saveFile);
        
        /*디비에 파일 넣기*/
        eqmVO.setEqmImg(fileName);

        /*저장되는 경로*/
        eqmVO.setEqmImgPath("resources/assets/img/" + fileName); /*저장된파일의이름,저장된파일의경로*/
        
        /*파일 저장*/
        service.insertEqm(eqmVO);
		
		return "redirect:eqm";
		/////////////////////////
		//service.insertEqm(eqmVO);
		//return "redirect:eqm";
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

	/*
	 * 점검검색조회
	 * 
	 * @PostMapping("/searchEqmCheck")
	 * 
	 * @ResponseBody public List<EqmVO> searchEqmCheck(@RequestBody EqmVO
	 * searchKeywords){ return "";
	 * 
	 * }
	 */

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
