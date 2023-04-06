package com.yedam.spring.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.order.mapper.OrderMapper;
import com.yedam.spring.order.service.OrderService;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.vend.mapper.VendMapper;
import com.yedam.spring.vend.service.VendVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	VendMapper vendMapper;

	@Override
	public List<OrderSheetVO> selectOrderList() {
		return orderMapper.selectOrderList();
	}

	@Override
	public OrderSheetVO selectOrderNo() {
		System.out.println(orderMapper.selectOrderNo());
		return orderMapper.selectOrderNo();
	}

	@Override
	public List<VendVO> getVendAll() {
		return vendMapper.selectVendAllList();
	}
}
