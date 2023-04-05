package com.yedam.spring.eqm.mapper;

import java.util.List;

import com.yedam.spring.eqm.service.EqmVO;

public interface EqmMapper {
	//설비전체조회
	public List<EqmVO> selectEqmList();
	//설비코드 최대값
	public EqmVO selectMaxCd();
	
	//설비등록
	public int insertEqm(EqmVO eqmVO);
	
	//설비단건조회
	public EqmVO selectEqm(EqmVO eqmVO);
	
	//삭제
	public int deleteEqm(EqmVO eqmVO);
	
	//수정
	public int updateEqm(EqmVO eqmVO);
}
