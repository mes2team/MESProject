package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.sales.service.EdctsIstService;
import com.yedam.spring.sales.service.EdctsOustService;
import com.yedam.spring.sales.service.OrderService;

@Controller
public class EdctsOustController {
	
	@Autowired
	EdctsOustService edctsoustService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	EdctsIstService edctsistService;
	
	// 출고 페이지
	@GetMapping("edctsOust")
	public String edctsOustForm(Model model, String orderNo) {
		model.addAttribute("orderList", orderService.selectOrderList());
		model.addAttribute("edctsOustList", edctsoustService.selectEdctsOustAll());
		return "sales/edctsOustMag";
	}
	
	// 주문서 디테일 조회
	@GetMapping("edctsOustOrderDetail")
	@ResponseBody
	public List<OrderSheetVO> orderDetailList(String orderNo){
		return orderService.selectOrderDetail(orderNo);
	}
	
	// 완제품 입고 조회
//	@GetMapping("edctsOustProduct")
//	@ResponseBody
//	public List<EdctsIstVO> edctsOustProductList
	
}
