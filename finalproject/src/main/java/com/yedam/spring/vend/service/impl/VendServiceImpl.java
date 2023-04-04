package com.yedam.spring.vend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.vend.mapper.VendMapper;
import com.yedam.spring.vend.service.VendService;
import com.yedam.spring.vend.service.VendVO;

@Service
public class VendServiceImpl implements VendService {

	@Autowired
	VendMapper vendMapper;
	
	@Override
	public List<VendVO> getVendAll() {
		return vendMapper.selectVendAllList();
	}

	@Override
	public VendVO getVendInCd() {
		return vendMapper.getVendInCd();
	}

	@Override
	public VendVO getVendOutCd() {
		return vendMapper.getVendOutCd();
	}

	@Override
	public int insertVend(VendVO vendVo) {
		return vendMapper.insertVendInfo(vendVo);
	}



}
