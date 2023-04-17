package com.yedam.spring.sales.service;

import java.util.List;

public interface FinishedPrdService {

	// 완제품 전체 조회
	public List<FinishedPrdVO> finishedPrdAllList();

	// 완제품 검색
	public List<FinishedPrdVO> searchFinishedPrd(FinishedPrdVO vo);
}
