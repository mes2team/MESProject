package com.yedam.spring.sales.mapper;

import java.util.List;

import com.yedam.spring.sales.service.EdctsOustVO;

public interface EdctsOustMapper {

	// 출고 전체 조회
	public List<EdctsOustVO> selectEdctsOustAll();

}
