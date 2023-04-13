package com.yedam.spring.masterData.service;

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
	
	// 거래처 삭제
	public int deleteVend(String vendCd);
	
	// 거래처 검색
	public List<VendVO> getSerarchVend(VendVO vendVo);
	
	// 거래처 수정
	public int updateVend(VendVO vendVO);
	
	// 거래처 디테일
	public VendVO getVendDetail(VendVO vendVO);
}
