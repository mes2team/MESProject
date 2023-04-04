package com.yedam.spring.eqm.mapper;

import java.util.List;

import com.yedam.spring.eqm.service.EqmVO;

public interface EqmMapper {
	//설비전체조회
	public List<EqmVO> selectEqmList();
	
	//설비등록
	public int insertEqm(EqmVO eqmVO);
}
