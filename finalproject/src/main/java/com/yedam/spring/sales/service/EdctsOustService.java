package com.yedam.spring.sales.service;

import java.util.List;

public interface EdctsOustService {
	
	// 출고 전체 조회
	public List<EdctsOustVO> selectEdctsOustAll();
	
	// 출고 등록 and 완제품 수량 수정
	public int insertUpdateEdcts(EdctsOustVO vo);
	
	// 출고 삭제
	public int deleteEdctsOust(EdctsOustVO vo);
	
}
