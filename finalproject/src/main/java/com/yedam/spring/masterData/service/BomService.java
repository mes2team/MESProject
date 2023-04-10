package com.yedam.spring.masterData.service;

import java.util.List;

import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.ProPrcsVO;

public interface BomService {
	// bom 조회
	public List<BomVO> getBomList(String edctsCd);
	
	// 공정 조회
	public List<ProPrcsVO> getPrcsList();

}
