package com.yedam.spring.eqm.service;

import java.util.List;

public interface EqmService {
	//설비전체조회
	public List<EqmVO> selectEqmList();
	
    //설비등록
	public int insertEqm(EqmVO eqmVO);
}
