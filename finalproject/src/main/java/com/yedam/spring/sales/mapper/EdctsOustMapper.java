package com.yedam.spring.sales.mapper;

import java.util.List;


import com.yedam.spring.sales.service.EdctsOustVO;

public interface EdctsOustMapper {

	// 출고 전체 조회
	public List<EdctsOustVO> selectEdctsOustAll();

	// 출고 등록 and 완제품 수량 수정
	public int insertUpdateEdcts(EdctsOustVO vo);

	// 출고 삭제
	public int deleteEdctsOust(EdctsOustVO vo);
}
