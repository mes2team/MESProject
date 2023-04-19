package com.yedam.spring.prcsInsp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.prcsInsp.mapper.PrcsInspMapper;
import com.yedam.spring.prcsInsp.service.PrcsInspService;
import com.yedam.spring.prcsInsp.service.PrcsInspVO;

@Service
public class PrcsInspServiceImpl implements PrcsInspService{
@Autowired	
PrcsInspMapper mapper;

@Override
public List<PrcsInspVO> selectPrcsList() {
	return mapper.selectPrcsList();
}

@Override
public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd) {
	return mapper.selectPrcsStd(prcsCd);
}

@Override
public int insertDtl(PrcsInspVO prcsInspVO) {
	return mapper.insertDtl(prcsInspVO);
}

@Override
public PrcsInspVO selectMaxChkCd() {
	return mapper.selectMaxChkCd();
}

@Override
public int inferUpdateInsert(PrcsInspVO prcsInspVO) {
	return mapper.inferUpdateInsert(prcsInspVO);
}

@Override
public List<PrcsInspVO> selectCompletedPrcs() {
	return mapper.selectCompletedPrcs();
}

@Override
public List<PrcsInspVO> inspDtl(PrcsInspVO prcsInspVO) {
	return mapper.inspDtl(prcsInspVO);
}

@Override
public int deleteCompleted(String deleteList) {
	return mapper.deleteCompleted(deleteList);
}

@Override
public int updateIndiPlan(PrcsInspVO prcsInspVO) {
	return mapper.updateIndiPlan(prcsInspVO);
}
}
