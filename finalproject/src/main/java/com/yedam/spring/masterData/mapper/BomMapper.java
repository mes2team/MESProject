package com.yedam.spring.masterData.mapper;

import java.util.List;

import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.ProPrcsVO;

public interface BomMapper {
	// bom 조회
	public List<BomVO> selectBomList(String edctsCd);

	// 공정 조회
	public List<ProPrcsVO> selectPrcsList();
}
