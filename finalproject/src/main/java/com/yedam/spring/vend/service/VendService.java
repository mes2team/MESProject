package com.yedam.spring.vend.service;

import java.util.List;

public interface VendService {
	// 전체조회
	public List<VendVO> getVendAll();

	// 등록하고자 하는 거래처 코드(매입처)
	public VendVO getVendInCd();

	// 등록하고자 하는 거래처 코드(매출처)
	public VendVO getVendOutCd();
	
	// 거래처 등록
	public int insertVend(VendVO vendVo);
}
