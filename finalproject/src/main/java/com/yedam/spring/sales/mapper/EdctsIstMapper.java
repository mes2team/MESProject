package com.yedam.spring.sales.mapper;

import java.util.List;

import com.yedam.spring.sales.service.EdctsIstVO;

public interface EdctsIstMapper {

	// 입고 제품 조회
	public List<EdctsIstVO> getEdctsIstList();

	// 포장 검사 완료된 제품 조회
	public List<EdctsIstVO> getCompletePro();

	// 입고 제품 등록
	public int insertEdctsIst(EdctsIstVO vo);

	// 입고 제품 검색
	public List<EdctsIstVO> searchEdctsList(EdctsIstVO vo);

}
