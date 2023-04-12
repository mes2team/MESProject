package com.yedam.spring.sales.mapper;

import java.util.List;

import com.yedam.spring.sales.service.EdctsIstVO;

public interface EdctsIstMapper {

	// 제품 입고 조회
	public List<EdctsIstVO> getEdctsIstList();

	// 포장 검사 완료된 제품 조회
	public List<EdctsIstVO> getCompletePro();

	// 제품 입고 등록
	public int insertEdctsIst(EdctsIstVO vo);

}
