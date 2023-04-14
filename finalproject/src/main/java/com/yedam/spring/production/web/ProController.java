package com.yedam.spring.production.web;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.common.PageDTO;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;
import com.yedam.spring.production.service.ProService;

@Controller
public class ProController {

	@Autowired
	ProService proService;
	
	// 생산계획 수정
	@PostMapping("/modifyProPlan")
	@ResponseBody
	public Map<String, Object> modifyProPlan(@RequestBody List<ProPlanVO> proPlanArray) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (int i = 0; i < proPlanArray.size(); i++) {
			result = proService.modifyProPlan(proPlanArray.get(i));;
			
		}
		resultMap.put("result", result);
		return resultMap;
	}
	
	// 생산계획 상세정보
	@PostMapping("/getPlanDetail")
	@ResponseBody
	public Map<String, Object> getPlanDetail(ProPlanVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", proService.getPlanDetail(vo));
		return resultMap;
	}

	// 생산계획 페이지 이동
	@GetMapping("/productionPlan")
	public String proPlanPage(Criteria cri, Model model) {
		model.addAttribute("bomInfo", proService.getBomInfo());
		int total = proService.getProPlanCnt();
		model.addAttribute("ProPlans", proService.getProPlans(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "production/productionplan";
	}

	@GetMapping("/getPrdtInfo")
	@ResponseBody
	public Map<String, Object> getPrdtInfo() {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("prdtInfo", proService.getprdtInfo());
		return resultMap;
	}

	// 생산계획 다중등록처리
	@PostMapping("/addnewPlans")
	@ResponseBody
	public Map<String, Object> addnewPlans(@RequestBody List<ProPlanVO> proPlanArray) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (int i = 0; i < proPlanArray.size(); i++) {
			if (i == 0) {
				result = proService.newPlanInsert(proPlanArray.get(i));
			} else {
				result = proService.plusPlanInsert(proPlanArray.get(i));
			}
		}
		resultMap.put("result", result);
		return resultMap;
	}

	// 주문서 처리
	@PostMapping("/prcsOrderSheet")
	@ResponseBody 
	public Map<String, Object> prcsOrderSheet(@RequestBody List<String> orderArray) {
	  Map<String, Object> resultMap = new HashMap<>(); 
	  String result = null;
	  String key = null;
	  for(int i=0; i<orderArray.size(); i++) { 
	    result = proService.modifyOrderStatus(orderArray.get(i));
	    key = "result" + i;
	    resultMap.put(key, result);
	  }	  
	  return resultMap; 
	}

	// 미지시된 주문서 조회
	@GetMapping("/getOrderSheet")
	@ResponseBody
	public Map<String, Object> getOrderSheet() {
		Map<String, Object> resultMap = new HashMap<>();
		List<OrderSheetVO> orderSheetVO = proService.getOrdSheet();
		Set<String> orderNoSet = new HashSet<>(); 

		for (OrderSheetVO vo : orderSheetVO) {
			orderNoSet.add(vo.getOrderNo());
		}

		String[] ordCode = orderNoSet.toArray(new String[0]); 

		resultMap.put("ordCode", ordCode);
		resultMap.put("result", orderSheetVO);
		return resultMap;
	}

	// BOM에 맞는 자재 정보
	@GetMapping("/getBomRscInfo")
	@ResponseBody
	public Map<String, Object> getBomRscInfo(BomVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("BomRscInfo", proService.getBomRscInfo(vo));
		return resultMap;
	}

	// 생산계획삭제
	@PostMapping("/deletePlan")
	@ResponseBody
	public String deleteProPlan(@RequestBody List<String> planCdList) {
		String result = null;

		for (String planCd : planCdList) {
			if(proService.checkOrderNo(planCd) != null) {
				result = proService.removePlan(planCd);
			}
		}

		return result;
	}

	// 제품별 BOM 조회
	@GetMapping("/getPrdtBom")
	@ResponseBody
	public Map<String, Object> getPrdtBom(BomVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", proService.getBomInfo(vo));
		return resultMap;
	}

	// 공정관리 페이지 이동
	@GetMapping("/processManage")
	public String processManagePage(Criteria cri, Model model) {
		int total = proService.getProPlanCnt();
		model.addAttribute("prcsList", proService.getprcsList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "production/processManage";
	}

	// 공정관리 다중등록처리
	@PostMapping("/addPrcs")
	@ResponseBody
	public Map<String, Object> addPrcs(@RequestBody ProPrcsVO[] prcsVO) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (ProPrcsVO vo : prcsVO) {
			result = proService.addPrcs(vo);
		}
		return resultMap;
	}

	// 공정삭제
	@PostMapping("/removePrcs")
	@ResponseBody
	public String removePrcs(@RequestBody List<String> prcsCdList) {
		String result = null;

		for (String prcsCd : prcsCdList) {
			result = proService.removePrcs(prcsCd);
		}

		return result;
	}

	// 생산지시 페이지 이동
	@GetMapping("/productionOrder")
	public String productionOrderPage(Criteria cri, Model model) {
		int total = proService.getProOrderCnt();
		model.addAttribute("ProOrders", proService.getProOrders(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "production/productionOrder";
	}

	// 미지시된 생산계획 조회
	@GetMapping("/getPlanToOrder")
	@ResponseBody
	public Map<String, Object> getPlanToOrder() {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", proService.getPlanToOrder());
		System.out.println(resultMap);
		return resultMap;
	}

	// BOM 단건 조회
	@GetMapping("/getBomInfo")
	@ResponseBody
	public Map<String, Object> getBomInfo(BomVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", proService.getBomStock(vo));
		System.out.println(resultMap);
		return resultMap;
	}

	// 완제품에 대한 자재 재고정보 조회
	@PostMapping("/getRscStock")
	@ResponseBody
	public Map<String, Object> getRscStock(@RequestBody List<String> edctsCds) {
		Map<String, Object> resultMap = new HashMap<>();

		for (int i = 0; i < edctsCds.size(); i++) {
			String resultName = edctsCds.get(i);
			String edctsCd = edctsCds.get(i);
			resultMap.put(resultName, proService.getRscStock(edctsCd));
		}

		return resultMap;
	}
	
	//공정흐름 단건조회
	@PostMapping("/getPrcsFlow")
	@ResponseBody
	public Map<String, Object> getPrcsFlow(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("prcsFlow", proService.getPrcsFlow(vo));

		return resultMap;
	}
}
