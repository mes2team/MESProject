package com.yedam.spring.prdtInsp.service;

import java.util.List;

public interface PrdtInspService {
	//모달용 주문서 전체조회
	public List<PrdtInspVO> selectOrderList();
	
	//최대 완제품LOT번호
	public PrdtInspVO selectMaxEdctsLotNo();
}
