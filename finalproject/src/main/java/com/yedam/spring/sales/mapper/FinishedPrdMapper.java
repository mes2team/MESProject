package com.yedam.spring.sales.mapper;

import java.util.List;

import com.yedam.spring.sales.service.FinishedPrdVO;

public interface FinishedPrdMapper {

	// 완제품 전체 조회
	public List<FinishedPrdVO> finishedPrdAllList();
	
	// 완제품 검색
	public List<FinishedPrdVO> searchFinishedPrd(FinishedPrdVO vo);

}
