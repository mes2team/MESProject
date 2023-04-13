package com.yedam.spring.sales.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.sales.service.EdctsOustService;
import com.yedam.spring.sales.service.OrderService;

@Controller
public class EdctsOustController {
	
	@Autowired
	EdctsOustService edctsoustService;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("edctsOust")
	public String edctsOustForm(Model model) {
		model.addAttribute("orderList", orderService.selectOrderList());
		return "sales/edctsOustMag";
	}
}
