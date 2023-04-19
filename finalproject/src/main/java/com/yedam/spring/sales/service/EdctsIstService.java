package com.yedam.spring.sales.service;

import java.util.List;

public interface EdctsIstService {

	// 입고 제품 조회
	public List<EdctsIstVO> selectEdctsIstAll();

	// 포장 검사 완료된 제품 조회
	public List<EdctsIstVO> selectCompletePro();

	// 입고 제품 등록
	public int insertEdctsIst(EdctsIstVO vo);
	
	// 입고 제품 검색
	public List<EdctsIstVO> searchEdctsList(EdctsIstVO vo);
	
	// 입고 제품 삭제
	public int deleteEdctsIst(EdctsIstVO vo);
	
	// 입고 제품 단건조회
	public List<EdctsIstVO> selectSingleList(EdctsIstVO vo);
	
	// 입고하면 지시 현재상태 update
	public int updateIndicaSt(EdctsIstVO vo);
}
