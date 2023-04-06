package com.yedam.spring.eqm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.eqm.mapper.EqmMapper;
import com.yedam.spring.eqm.service.EqmService;
import com.yedam.spring.eqm.service.EqmVO;

@Service
public class EqmServiceImpl implements EqmService{
	@Autowired
	EqmMapper mapper;
	//전체조회
	@Override
	public List<EqmVO> selectEqmList() {
		return mapper.selectEqmList();
	}
	//등록
	@Override
	public int insertEqm(EqmVO eqmVO) {
		return mapper.insertEqm(eqmVO);
	}
	//최대코드
	@Override
	public EqmVO selectMaxCd() {
		return mapper.selectMaxCd();
	}
	//단건조회
	@Override
	public EqmVO selectEqm(EqmVO eqmVO) {
		return mapper.selectEqm(eqmVO);
	}
	@Override
	public int deleteEqm(EqmVO eqmVO) {
		return mapper.deleteEqm(eqmVO);
	}
	@Override
	public int updateEqm(EqmVO eqmVO) {
		return mapper.updateEqm(eqmVO);
	}
	///////설비점검내역////////
	@Override
	public List<EqmVO> selectCheckList() {
		return mapper.selectCheckList();
	}
	@Override
	public List<EqmVO> searchEqmCheck() {
		return mapper.searchEqmCheck();
	}

}
