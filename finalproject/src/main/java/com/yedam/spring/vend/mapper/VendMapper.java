package com.yedam.spring.vend.mapper;

import java.util.List;

import com.yedam.spring.vend.service.VendVO;

public interface VendMapper {
	// 전체조회
	public List<VendVO> selectVendAllList();

	// 등록하고자 하는 거래처 코드(매입처)
	public VendVO getVendInCd();

	// 등록하고자 하는 거래처 코드(매출처)
	public VendVO getVendOutCd();

	// 거래처 등록
	public int insertVendInfo(VendVO vendVo);
}
