package com.yedam.spring.sales.service;

import java.util.List;

public interface EdctsIstService {

	// 제품 입고 조회
	public List<EdctsIstVO> selectEdctsIstAll();

	// 포장 검사 완료된 제품 조회
	public List<EdctsIstVO> selectCompletePro();

	// 제품 입고 등록
	public int insertEdctsIst(EdctsIstVO vo);
}
