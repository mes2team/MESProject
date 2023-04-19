package com.yedam.spring.masterData.service;

import java.util.List;

public interface EdctsService {

	// 전체 조회
	public List<EdctsVO> getEdctsList();

	// bom 헤더에 등록안된 제품 조회
	public List<EdctsVO> getBomHeaderPrd();

}
