package com.yedam.spring.prcsInsp.service;

import java.util.List;

public interface PrcsInspService {
	// 모달용 검사 전체조회
	public List<PrcsInspVO> selectPrcsList();

	// 최대 완제품LOT번호
	public PrcsInspVO selectMaxEdctsLotNo();
}
