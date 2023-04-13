package com.yedam.spring.masterData.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.masterData.mapper.VendMapper;
import com.yedam.spring.masterData.service.VendService;
import com.yedam.spring.masterData.service.VendVO;

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

	@Override
	public int deleteVend(String vendCd) {
		return vendMapper.deleteVend(vendCd);
	}

	@Override
	public List<VendVO> getSerarchVend(VendVO vendVo) {
		return vendMapper.selectSerarchVend(vendVo);
	}

	@Override
	public int updateVend(VendVO vendVO) {
		return vendMapper.updateVend(vendVO);
	}

	@Override
	public VendVO getVendDetail(VendVO vendVO) {
		return vendMapper.getVendDetail(vendVO);
	}



}
