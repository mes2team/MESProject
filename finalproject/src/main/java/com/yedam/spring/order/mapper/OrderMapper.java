package com.yedam.spring.order.mapper;

import java.util.List;

import com.yedam.spring.order.service.OrderPrdTestVO;
import com.yedam.spring.order.service.OrderTestVO;

public interface OrderMapper {
	// 전체조회
	public List<OrderTestVO> selectOrderList();

	// 주문번호 조회
	public OrderTestVO selectOrderNo();

	// 상품정보 조회
	public List<OrderPrdTestVO> selectOrderPrd();

	// 주문서 등록
	public int insertOrder(OrderTestVO vo);

	// 주문서 디테일 등록
	public int insertOrderPrd(OrderPrdTestVO vo);

	// 주문서 삭제
	public int deleteOrder(OrderTestVO vo);
}
