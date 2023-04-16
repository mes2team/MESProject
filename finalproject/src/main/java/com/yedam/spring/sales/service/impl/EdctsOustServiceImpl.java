package com.yedam.spring.sales.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.EdctsOustMapper;
import com.yedam.spring.sales.service.EdctsOustService;
import com.yedam.spring.sales.service.EdctsOustVO;

@Service
public class EdctsOustServiceImpl implements EdctsOustService {
	
	@Autowired
	EdctsOustMapper edctsoustMapper;

	@Override
	public List<EdctsOustVO> selectEdctsOustAll() {
		return edctsoustMapper.selectEdctsOustAll();
	}

	@Override
	public int insertUpdateEdcts(EdctsOustVO vo) {
		return edctsoustMapper.insertUpdateEdcts(vo);
	}

	@Override
	public int deleteEdctsOust(EdctsOustVO vo) {
		return edctsoustMapper.deleteEdctsOust(vo);
	}

}
