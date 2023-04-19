package com.yedam.spring.prcsInsp.mapper;

import java.util.List;

import com.yedam.spring.prcsInsp.service.PrcsInspVO;

public interface PrcsInspMapper {
	//모달용 검사 전체조회
	public List<PrcsInspVO> selectPrcsList();
	
	//공정별 검사기준
	public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd);
	
	//공정검사완료 검사디테일등록
	public int insertDtl(PrcsInspVO prcsInspVO);
	
	//공정검사완료 불량등록 / 불량,검사완료 업데이트
	public int inferUpdateInsert(PrcsInspVO prcsInspVO);
	//맥스검사완료코드
	public PrcsInspVO selectMaxChkCd();
	
	//검사완료리스트
	public List<PrcsInspVO> selectCompletedPrcs();
	
	//검사완료 단건조회
	public List<PrcsInspVO> inspDtl(PrcsInspVO prcsInspVO);
	
	//검사완료 삭제
	public int deleteCompleted(String deleteList);
	
	//포장완료 지시계획수정
	public int updateIndiPlan(PrcsInspVO prcsInspVO);
	
}
