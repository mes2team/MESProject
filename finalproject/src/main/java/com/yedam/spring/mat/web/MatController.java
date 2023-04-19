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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.mat.service.MatService;
import com.yedam.spring.mat.service.MatVO;

@Controller
public class MatController {
	@Autowired
	MatService matService;
	
	//조회(데이터, 일반페이지) -> GET
	//등록, 수정, 삭제 -> POST
	
	//자재정보전체조회
	@GetMapping("/matList")
	public String getMatAllList(Model model) {
		model.addAttribute("matList",matService.matList());
		return "material/matList";
	}
	//ajax용 자재정보전체조회
	@GetMapping("/ajaxMatList")
	@ResponseBody
	public List<MatVO> ajaxMatList() {
		return matService.matList();
	}
	//자재정보단건조회
	@GetMapping("/matInfo")
	@ResponseBody
	public MatVO getMat(MatVO matVO) {		
		return matService.getMat(matVO); 
	}
	//사용하는 자재목록 조회
	@GetMapping("/matUseModal")
	@ResponseBody
	public List<MatVO> matUseList(){
		return matService.matUseList();
	}
	//자재거래처 조회
	@GetMapping("/VendModal")
	@ResponseBody
	public List<MatVO> matVendList(){
		return matService.matVendList();
	}
	
	//자재정보등록	
	@PostMapping("/matInsert")
	@ResponseBody
	public List<MatVO> matInsertProcess(MatVO matVO) {
		matService.insertMat(matVO);
		return matService.matList();
	}
	//자재정보 수정
	@PostMapping("/matUpdate")
	@ResponseBody
	public List<MatVO> matUpdateProcess(MatVO arr) {
		matService.updateMat(arr);
		return matService.matList();
	}
	//자재정보단건조회
//	@GetMapping("/matInfo")
//	@ResponseBody
//	public MatVO getMat(MatVO matVO, Model model) {
//		model.addAttribute("matInfo",matService.getMat(matVO));
//		matVO = matService.getMat(matVO);
//		return matVO; 
//	}
	//등록 - form이동
//	@GetMapping("/matInsert")
//	public String matInsertForm() {
//		return "material/matInsert";
//	}
	//자재정보 등록 - Process
//	@PostMapping("/matInsert")
//	@ResponseBody
//	public String matInsertProcess(MatVO matVO) {
//		matService.insertMat(matVO);
//		return "redirect:matList";
//	}
	//자재정보 수정 - process /
	//비동기식 - JSON반환 방식 (굳이 써보는것)
	//1) client - JSON -> Server
	//2) Server - text -> Client
//	@PostMapping("/matUpdate")
//	@ResponseBody
//	public Map<String, String> matUpdateProcess(@RequestBody MatVO matVO) {
//		return matService.updateMat(matVO);
//	}
//	//자재정보 삭제
//	@PostMapping("/matDelete")
//	@ResponseBody
//	public String matDeleteProcess(@RequestParam String rscCd) {
//		Map<String, String> map = matService.deleteMat(rscCd);
//		return map.get("결과");
//	}
	
	//자재발주 전체목록 + 자재재고현황
	@GetMapping("/matOrder")
	public String getMatOrderList(Model model) {
		model.addAttribute("matOrderList",matService.matOrderList());
		model.addAttribute("matStock",matService.matStock());
		return "material/matOrder";
	}
	//자재발주 단건조회
		@GetMapping("/ordrInfo")
		@ResponseBody
		public MatVO getOrdr(MatVO matVO) {		
			return matService.getMatOrderInfo(matVO); 
		}
	// 자재발주등록
	@PostMapping("/matOrderInsert")
	@ResponseBody
	public List<MatVO> vendInsertProcess(MatVO matVO) {
		matService.addMatOrderInfo(matVO);
		return matService.matOrderList();
	}
//		@PostMapping("/matOrderInsert")
//		public String vendInsertProcess(MatVO matVO) {
//			matService.addMatOrderInfo(matVO);
//			return "redirect:matOrder";
//		}
	// 자재발주수정
	@PostMapping("/updatematOrder")
	@ResponseBody
	public List<MatVO> updatematOrder(MatVO arr) {
		matService.updatematOrder(arr);
		return matService.matOrderList();
	}
	
	
	//자재발주삭제
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
	
	//자재입고 전체조회
	@GetMapping("/matReceipt")
	public String getMatReceipt(Model model) {
		model.addAttribute("matReceiptList",matService.matReceiptList());
		return "material/matReceipt";
	}
	//입고미완료 발주 전체 조회
	@GetMapping("/checkModal")
	@ResponseBody
	public List<MatVO> matReceiptChkList(){
		return matService.matReceiptChkList();
		}
	//자재입고 등록 - Process
	@PostMapping("/matReceiptInsert")
	@ResponseBody
	public List<MatVO> matReceiptProcess(MatVO matVO) {
		matService.addMatReceipt(matVO);
		return matService.matReceiptList();
	}
	//자재입고 단건조회
		@GetMapping("/selectMatReceipt")
		@ResponseBody
		public MatVO selectMatReceipt(MatVO matVO) {
			return matService.getMatReceiptInfo(matVO);
		}
	// 자재입고수정(여러개 동시에 수정할 때 @RequestBody MatVO[] arr)
	@PostMapping("/updateMatReceipt")
	@ResponseBody
	public List<MatVO> updateMatReceipt(MatVO arr) {
		System.out.println("출력" +arr);
	    	matService.updateMatReceipt(arr);
        return matService.matReceiptList();
	}
//여러개 수정할 때	
//	public Map<String, Object> updateMatReceipt(@RequestBody MatVO[] arr) {
//		Map<String, Object> map = new HashMap<>();
//	    if (arr == null) {
//	    	map.put("result", "false");
//	    	map.put("data", null);
//	        return map;
//	    }
//	    for (int i = 0; i < arr.length; i++) {
//	    	matService.updateMatReceipt(arr[i]);
//	    }
//	    
//	    List<MatVO> list = matService.matReceiptList();
//	    map.put("result", "success");
//    	map.put("data", list);
//        return map;
//	}
	
	//자재입고삭제
	@PostMapping("/matReceiptDelete")
	@ResponseBody
	public String matReceiptDeleteProcess(@RequestBody MatVO[] arr) {
		for (int i = 0; i < arr.length; i++) {
			matService.removeMatReceipt(arr[i]);
		}
		return "success";
	}
	
	//자재검사 전체조회
	@GetMapping("/matCheck")
	public String getMatCheck(Model model) {
		model.addAttribute("matCheckList",matService.matCheckList());
		return "material/matCheck";
		}
	//검사미완료 발주 전체 조회
	@GetMapping("/orderModal")
	@ResponseBody
	public List<MatVO> orderChkList(){
		return matService.matOrderChkList();
		}
	//자재 검수자 조회
	@GetMapping("/checkerModal")
	@ResponseBody
	public List<MatVO> checkerModal(){
		return matService.checkerList();
	}
	//자재검사등록	
	@PostMapping("/matCheckInsert")
	@ResponseBody
	public List<MatVO> insertMatCheckProcess(MatVO matVO) {
		matService.addMatCheck(matVO);
		return matService.matCheckList();
	}
	//자재검사 단건조회
	@GetMapping("/selectMatCheck")
	@ResponseBody
	public MatVO selectMatCheck(MatVO matVO) {
		return matService.getMatCheckInfo(matVO);
	}
	
	// 자재검사 수정(단건수정)
	@PostMapping("/updateMatCheckInfo")
	@ResponseBody
	public List<MatVO> updateMatCheckInfo(MatVO arr) {
		System.out.println("출력" +arr);
	    	matService.updateMatCheckInfo(arr);
        return matService.matCheckList();
	}
	//자재검사삭제
	@PostMapping("/removeMatatCheck")
	@ResponseBody
	public String matCheckDeleteProcess(@RequestBody MatVO[] arr) {
		for (int i = 0; i < arr.length; i++) {
			matService.removeMatatCheckInfo(arr[i]);
		}
		return "success";
	}

}
