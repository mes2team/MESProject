package com.yedam.spring.prcsInsp.mapper;

import java.util.List;

import com.yedam.spring.prcsInsp.service.PrcsInspVO;

public interface PrcsInspMapper {
	//모달용 검사 전체조회
	public List<PrcsInspVO> selectPrcsList();
	
	//공정별 검사기준
	public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd);
	
	//최대 완제품LOT번호
	public PrcsInspVO selectMaxEdctsLotNo();
}
