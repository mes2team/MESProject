package com.yedam.spring.masterData.mapper;

import java.util.List;

import com.yedam.spring.masterData.service.EdctsVO;

public interface EdctsMapper {

	// 전체 조회
	public List<EdctsVO> selectEdctsList();

	// bom 헤더에 등록안된 제품 조회
	public List<EdctsVO> getBomHeaderPrd();
}
