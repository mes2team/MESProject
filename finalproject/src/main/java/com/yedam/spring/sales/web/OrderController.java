package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.masterData.service.VendService;
import com.yedam.spring.masterData.service.VendVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.sales.service.OrderService;

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
		model.addAttribute("orderPrdList", orderService.selectOrderPrd());
		return "sales/orderMag";
	}
	
	// 주문서 번호 조회
	@GetMapping("/orderNo")
	@ResponseBody
	public String getOrderNo() {
		return orderService.selectOrderNo().getOrderNo();
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
	public String orderInsertProcess(OrderSheetVO vo) {
		orderService.insertOrder(vo);
		return "success1";
	}
	
	// 주문서등록디테일
	@PostMapping("/orderInsertDetail")
	@ResponseBody
	public String orderInsertDetail(@RequestBody OrderSheetVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			orderService.insertOrderPrd(arr[i]);
		}
		return "success2";
	}
	
	//주문서 삭제
	@PostMapping("/orderDelete")
	@ResponseBody
	public String orderDelete(@RequestBody OrderSheetVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			orderService.deleteOrder(arr[i]);
		}
		return "success";
	}
	
	//주문서 진행도 수정
	@PostMapping("/orderUpdateProg")
	@ResponseBody
	public String orderUpdateProg(OrderSheetVO vo) {
		orderService.updateOrderProg(vo);
		return "success";
	}
	
	//주문서 디테일 조회
	@GetMapping("/orderDetail")
	@ResponseBody
	public List<OrderSheetVO> orderDetailList(String orderNo) {
		return orderService.selectOrderDetail(orderNo);
	}
	
	//주문서 검색
	@GetMapping("/searchOrder")
	@ResponseBody
	public List<OrderSheetVO> orderSearch(OrderSheetVO vo){
		return orderService.searchOrder(vo);
	}
	
	//주문서 수정
	@PostMapping("/updateOrder")
	@ResponseBody
	public String updateOrder(OrderSheetVO vo) {
		int result = orderService.updateOrder(vo);
		
		if(result == 1) {
			return "success";
		} else {
			return "error";
		}
	}
	
	//주문서 디테일 수정
	@PostMapping("/updateOrderDetail")
	@ResponseBody
	public String updateOrderDetail(@RequestBody OrderSheetVO[] arr) {
		for(int i = 0; i < arr.length; i++) {
			orderService.updateOrderDetail(arr[i]);
		}
		
		return "success";
	}
	
	//주문서 디테일 삭제
	@PostMapping("/deleteOrderDetail")
	@ResponseBody
	public String deleteOrderDetail(OrderSheetVO vo) {
		orderService.deleteOrderDetail(vo);
		return "success";
	}
}
