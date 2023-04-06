package com.yedam.spring.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.order.service.OrderService;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.vend.service.VendService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	VendService vendService;

	// 전체조회
	@GetMapping("/orderMag")
	public String getOrderAllList(Model model) {
		model.addAttribute("orderList", orderService.selectOrderList());
		model.addAttribute("vendList", vendService.getVendAll());
		return "order/orderMag";
	}
	
	// 주문번호조회
	@GetMapping("/orderNo")
	@ResponseBody
	public OrderSheetVO getOrderNo() {
		return orderService.selectOrderNo();
	}
	
	// 거래처조회
//	@GetMapping("/orderVendList")
//	public String orderVendList(Model model){
//		
//		return "";
//	}
}
