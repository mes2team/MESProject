package com.yedam.spring.order.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.order.service.OrderPrdTestVO;
import com.yedam.spring.order.service.OrderService;
import com.yedam.spring.order.service.OrderTestVO;
import com.yedam.spring.vend.service.VendService;
import com.yedam.spring.vend.service.VendVO;

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
		model.addAttribute("orderNo", orderService.selectOrderNo().getOrderNo());
		model.addAttribute("orderPrdList", orderService.selectOrderPrd());
		return "order/orderMag";
	}
	
	// 거래처조회
	@GetMapping("/orderVendList")
	@ResponseBody
	public List<VendVO> orderVendList(){
		return vendService.getVendAll();
	}
	
	// 주문서등록
	@PostMapping("/orderInsert")
	@ResponseBody
	public String orderInsertProcess(OrderTestVO vo) {
		orderService.insertOrder(vo);
		return "success1";
	}
	
	// 주문서등록디테일
	@PostMapping("/orderInsertDetail")
	@ResponseBody
	public String orderInsertDetail(@RequestBody OrderPrdTestVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			orderService.insertOrderPrd(arr[i]);
		}
		return "success2";
	}
	
	//주문서 삭제
	@PostMapping("/orderDelete")
	@ResponseBody
	public String orderDelete(@RequestBody OrderTestVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			orderService.deleteOrder(arr[i]);
		}
		return "success";
	}
}
