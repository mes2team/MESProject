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

//max 완제품LOT 번호
@Override
public PrcsInspVO selectMaxEdctsLotNo() {
	return mapper.selectMaxEdctsLotNo();
}

@Override
public List<PrcsInspVO> selectPrcsStd(PrcsInspVO prcsCd) {
	return mapper.selectPrcsStd(prcsCd);
}
}
