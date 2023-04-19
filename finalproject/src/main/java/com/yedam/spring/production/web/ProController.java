package com.yedam.spring.production.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.common.PageDTO;
import com.yedam.spring.masterData.service.EdctsService;
import com.yedam.spring.masterData.service.EdctsVO;
import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProOrderVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;
import com.yedam.spring.production.service.ProService;

@Controller
public class ProController {

	@Autowired
	ProService proService;
	
	@Autowired
	EdctsService edctsService;
	
	// 생산계획 수정
	@PostMapping("/modifyProPlan")
	@ResponseBody
	public Map<String, Object> modifyProPlan(@RequestBody List<ProPlanVO> proPlanArray) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		if(proService.preModiPlan(proPlanArray.get(0).getPlanCd())>0) {
			for (int i = 0; i < proPlanArray.size(); i++) {
				result = proService.modifyProPlan(proPlanArray.get(i));;
			}
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
		model.addAttribute("prdList", edctsService.getEdctsList()); // 공정흐름관리 제품 조회
		model.addAttribute("getPrcsList", proService.getPrcsList());
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
	
	//조건 조회
	@PostMapping("/getPlanToOrder")
	@ResponseBody
	public Map<String, Object> getPlanToOrder(ProOrderVO vo) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", proService.getPlanToOrder(vo));
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
	
	//생산공정실적 페이지
	@GetMapping("/productionResult")
	public String productionResultForm(Model model) {
		model.addAttribute("indicaList", proService.getIndica());
		return "production/productionResult";
	}
	
	//생산지시 내리기전 정보
	@PostMapping("/getIndicaDetail")
	@ResponseBody
	public Map<String, Object> getIndicaDetail(@RequestParam("edctsCd") String edctsCd) {
		Map<String, Object> resultMap = new HashMap<>();

		List<Object> results = new ArrayList<>();
		results.add(proService.getLotStock(edctsCd));
		results.add(proService.getPrcsFlow(edctsCd));
			
		resultMap.put("result", results);

		return resultMap;
	}
	
	@PostMapping("/getLotStk")
	@ResponseBody
	public Map<String, Object> getLotStk(@RequestParam("rscCd") String rscCd) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("result", proService.getLotStk(rscCd));

		return resultMap;
	}
	
	// 생산지시 다중등록처리
	@PostMapping("/addProOrder")
	@ResponseBody
	public Map<String, Object> addProOrder(@RequestBody List<ProOrderVO> arrProOrderVO) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (int i = 0; i < arrProOrderVO.size(); i++) {
			result = proService.newProOrderInsert(arrProOrderVO.get(i));
		}
		resultMap.put("result", result);
		return resultMap;
	}
	
	//진행공정 조회
	@PostMapping("/getPrcsProg")
	@ResponseBody
	public Map<String, Object> getPrcsProg(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("PrcsProg", proService.getPrcsProg(vo));

		return resultMap;
	}
	
	//진행공정/자재 조회
	@PostMapping("/getPrcsAndRsc")
	@ResponseBody
	public Map<String, Object> getPrcsAndRsc(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("result", proService.getPrcsAndRsc(vo));

		return resultMap;
	}
	
	//진행공정/설비 조회
	@PostMapping("/getEqmPrcs")
	@ResponseBody
	public Map<String, Object> getEqmPrcs(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("result", proService.getEqmPrcs(vo));

		return resultMap;
	}
	//공정시작
	@PostMapping("/modifyPrcsStart")
	@ResponseBody
	public Map<String, Object> modifyPrcsStart(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("result", proService.modifyPrcsStart(vo));

		return resultMap;
	}
	//사용할 시설 on
	@PostMapping("/modifyUseEqm")
	@ResponseBody
	public Map<String, Object> modifyUseEqm(@RequestBody List<String> selectedEqm) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (int i = 0; i < selectedEqm.size(); i++) {
			result = proService.modifyUseEqm(selectedEqm.get(i));
		}
		resultMap.put("result", result);
		return resultMap;
	}
	//사용할 자재 출고
	@PostMapping("/modifyUseRsc")
	@ResponseBody
	public Map<String, Object> modifyUseRsc(@RequestBody List<MatVO> rscArr) {
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		for (int i = 0; i < rscArr.size(); i++) {
			result = proService.modifyUseRsc(rscArr.get(i));
		}
		resultMap.put("result", result);
		return resultMap;
	}
	
	//공정스탑
	@PostMapping("/modifyPrcsStop")
	@ResponseBody
	public Map<String, Object> modifyPrcsStop(ProPrcsVO vo) {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("result", proService.modifyPrcsStop(vo));

		return resultMap;
	}
	
	// 공정흐름관리 제품 조회
	@PostMapping("/prcsFlowList")
	@ResponseBody
	public List<ProPrcsVO> processManagePrd(ProPrcsVO vo){
		return proService.getPrcsFlowList(vo);
	}
	
	// 공정 저장
	@PostMapping("/savePrcs")
	@ResponseBody
	public List<ProPrcsVO> selectPrcsList(@RequestBody ProPrcsVO[] arr){
		for(int i = 0; i < arr.length; i++) {
			proService.savePrcs(arr[i]);
		}
		return proService.getPrcsFlowList(arr[0]);
	}
	
	// 공정 삭제
	@PostMapping("/prcsFlowDel")
	@ResponseBody
	public List<ProPrcsVO> prcsFlowDel(@RequestBody ProPrcsVO[] arr){
		for(int i = 0; i < arr.length; i++) {
			proService.deletePrcsFlow(arr[i]);
		}
		return proService.getPrcsFlowList(arr[0]);
	} 
	
	@GetMapping("/getPrcsAndIndList")
	@ResponseBody
	public Map<String, Object> getPrcsAndIndList() {
		Map<String, Object> resultMap = new HashMap<>();

		resultMap.put("prcsList", proService.getPrcsResultList());
		resultMap.put("prcsAmount", proService.getPrcsAmountList());

		return resultMap;
	}
	@PostMapping("/getPrcsIndica")
	@ResponseBody
	public Map<String, Object> getPrcsIndica(ProPrcsVO vo){
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("PrcsIndica", proService.getPrcsIndica(vo));

		return resultMap;
	}
}
