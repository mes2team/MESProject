package com.yedam.spring.masterData.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.masterData.mapper.BomMapper;
import com.yedam.spring.masterData.service.BomService;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.ProPrcsVO;

@Service
public class BomServiceImpl implements BomService {
	
	@Autowired
	BomMapper bomMapper;

	@Override
	public List<BomVO> getBomList(String edctsCd) {
		return bomMapper.selectBomList(edctsCd);
	}

	@Override
	public List<ProPrcsVO> getPrcsList() {
		return bomMapper.selectPrcsList();
	}

}
