package com.yedam.spring.prcsInsp.service;

import java.util.List;

public interface PrcsInspService {
	// 모달용 검사 전체조회
	public List<PrcsInspVO> selectPrcsList();

	// 공정별 검사기준
	public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd);

	// 공정검사완료
	public int insertDtl(PrcsInspVO prcsInspVO);

	// 공정검사완료 불량등록 / 불량,검사완료 업데이트
	public int inferUpdateInsert(PrcsInspVO prcsInspVO);
	
	// 맥스검사완료코드
	public PrcsInspVO selectMaxChkCd();
}
