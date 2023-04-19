package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.FinishedPrdMapper;
import com.yedam.spring.sales.service.FinishedPrdService;
import com.yedam.spring.sales.service.FinishedPrdVO;

@Service
public class FinishedPrdServiceImpl implements FinishedPrdService {

		@Autowired
		FinishedPrdMapper finishedprdMapper;

		@Override
		public List<FinishedPrdVO> finishedPrdAllList() {
			return finishedprdMapper.finishedPrdAllList();
		}

		@Override
		public List<FinishedPrdVO> searchFinishedPrd(FinishedPrdVO vo) {
			return finishedprdMapper.searchFinishedPrd(vo);
		}
}
