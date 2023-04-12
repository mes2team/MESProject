package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.EdctsIstMapper;
import com.yedam.spring.sales.service.EdctsIstService;
import com.yedam.spring.sales.service.EdctsIstVO;

@Service
public class EdctsIstServiceImpl implements EdctsIstService {
	
	@Autowired
	EdctsIstMapper edctsistMapper;

	@Override
	public List<EdctsIstVO> selectEdctsIstAll() {
		return edctsistMapper.getEdctsIstList();
	}

	@Override
	public List<EdctsIstVO> selectCompletePro() {
		return edctsistMapper.getCompletePro();
	}

	@Override
	public int insertEdctsIst(EdctsIstVO vo) {
		return edctsistMapper.insertEdctsIst(vo);
	}

}
