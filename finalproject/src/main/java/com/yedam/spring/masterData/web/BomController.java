package com.yedam.spring.masterData.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.masterData.service.BomService;
import com.yedam.spring.masterData.service.EdctsService;
import com.yedam.spring.masterData.service.EdctsVO;
import com.yedam.spring.mat.service.MatService;
import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.ProPrcsVO;
import com.yedam.spring.production.service.ProService;

@Controller
public class BomController {
	@Autowired
	BomService bomService;
	
	@Autowired
	EdctsService edctsService;
	
	@Autowired
	MatService matService;
	
	@Autowired
	ProService proService;
	
	@GetMapping("bomMag")
	public String bomMagForm(Model model) {
		model.addAttribute("edctsList", edctsService.getEdctsList());
		model.addAttribute("rscList", matService.matList());
		return "bom/bomMag";
	}
	
	@GetMapping("bomList")
	@ResponseBody
	public List<BomVO> bomList(BomVO vo){
		return bomService.getBomList(vo);
	}
	
	@PostMapping("deleteBom")
	@ResponseBody
	public String deleteBomProcess(@RequestBody BomVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			bomService.deleteBom(arr[i]);
		}
		
		return "success";
	}
	
	@PostMapping("saveBom")
	@ResponseBody
	public String saveBomProcess(@RequestBody BomVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			bomService.saveBom(arr[i]);
		}
		
		return "success";
	}
	
	@PostMapping("searchBom")
	@ResponseBody
	public List<MatVO> searchBomProcess(MatVO vo) {
		return bomService.getMatList(vo);
	}
	
	@GetMapping("selectBomCd")
	@ResponseBody
	public String selectBomCd(BomVO vo) {
		return bomService.getBomCd(vo).getBomCd();
	}
	
	//bom 헤더에 없는 제품 조회
	@GetMapping("bomHeaderPrd")
	@ResponseBody
	public List<EdctsVO> bomHeaderPrd(){
		return edctsService.getBomHeaderPrd();
	}
	
	//bom헤더 등록
	@PostMapping("bomHeaderInsert")
	@ResponseBody
	public String bomHeaderInsert(BomVO vo) {
		bomService.insertBomHeader(vo);
		return "success";
	}
	
	@GetMapping("bomPrcsFlow")
	@ResponseBody
	public List<ProPrcsVO> bomPrcsFlow(ProPrcsVO vo) {
		return proService.getPrcsFlowList(vo);
	}
	
}
