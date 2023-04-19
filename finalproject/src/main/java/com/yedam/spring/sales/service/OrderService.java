package com.yedam.spring.sales.service;

import java.util.List;

import com.yedam.spring.production.service.OrderSheetVO;

public interface OrderService {
	// 전체조회
	public List<OrderSheetVO> selectOrderList();

	// 주문번호 조회
	public OrderSheetVO selectOrderNo();

	// 상품정보 조회
	public List<OrderSheetVO> selectOrderPrd();

	// 주문서 등록
	public int insertOrder(OrderSheetVO vo);

	// 주문서 디테일 등록
	public int insertOrderPrd(OrderSheetVO vo);

	// 주문서 삭제
	public int deleteOrder(OrderSheetVO vo);

	// 주문서 진행도 수정
	public int updateOrderProg(OrderSheetVO vo);

	// 주문서 디테일 조회
	public List<OrderSheetVO> selectOrderDetail(String orderNo);

	// 주문서 검색
	public List<OrderSheetVO> searchOrder(OrderSheetVO vo);

	// 주문서 수정
	public int updateOrder(OrderSheetVO vo);

	// 주문서 디테일 수정
	public int updateOrderDetail(OrderSheetVO vo);

	// 주문서 디테일 삭제
	public int deleteOrderDetail(OrderSheetVO vo);

	// 전체조회 출고쪽
	public List<OrderSheetVO> selectEdctsoutOrderList();

}
