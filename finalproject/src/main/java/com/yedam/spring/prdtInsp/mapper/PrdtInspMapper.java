package com.yedam.spring.prdtInsp.mapper;

import java.util.List;

import com.yedam.spring.prdtInsp.service.PrdtInspVO;

public interface PrdtInspMapper {
	//모달용 주문서 전체조회
	public List<PrdtInspVO> selectOrderList();
	
	//최대 완제품LOT번호
	public PrdtInspVO selectMaxEdctsLotNo();
}
