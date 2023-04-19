package com.yedam.spring.masterData.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.masterData.mapper.EdctsMapper;
import com.yedam.spring.masterData.service.EdctsService;
import com.yedam.spring.masterData.service.EdctsVO;

@Service
public class EdctsServiceImpl implements EdctsService {
	@Autowired
	EdctsMapper edctsmapper;

	@Override
	public List<EdctsVO> getEdctsList() {
		return edctsmapper.selectEdctsList();
	}

	@Override
	public List<EdctsVO> getBomHeaderPrd() {
		return edctsmapper.getBomHeaderPrd();
	}
}
