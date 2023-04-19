package com.yedam.spring.mat.mapper;

import java.util.List;

import com.yedam.spring.mat.service.MatVO;

public interface MatMapper {

	//자재정보 전체조회
	public List<MatVO> matList();
	//사용하는 자재정보 전체조회
	public List<MatVO> matUseList();
	//자재정보 단건 조회
	public MatVO selectMatInfo(MatVO matVO);
	//자재정보 등록
	public int insertMatInfo(MatVO matVO);
	//자재거래처 전체조회
	public List<MatVO> matVendList();
	//자재정보 수정
	public int updateMatInfo(MatVO matVO);
	//자재정보 삭제
	public int deleteMatInfo(String rscCd);
	
	//발주 전체 조회	
	public List<MatVO> matOrderAllList();
	//자재발주 단건 조회
	public MatVO selectMatOrderInfo(MatVO matVO);
	//자재발주 등록
	public int insertMatOrderInfo(MatVO matVO);
	//자재발주 수정
	public int updateMatOrderInfo(MatVO matVO);
	//자재발주 삭제
	public int deleteMatOrderInfo(String ordrCd);
	
	//자재 재고 현황
	public List<MatVO> matStockList();
	
	//자재입고 현황
	public List<MatVO> matReceiptList();
	//입고미완료 발주 전체 조회
	public List<MatVO> matReceiptChkList();
	//자재입고 단건 조회
	public MatVO selectMatReceiptInfo(MatVO matVO);
	//자재입고 추가
	public int insertMatReceipt(MatVO matVO);
	//자재입고 수정
	public int updateMatReceiptInfo(MatVO matVO);
	//자재발주 삭제
	public int deleteMatReceiptInfo(MatVO matVO);
	

	//자재검사목록
	public List<MatVO> matCheckList();
	//검사미완료 발주 전체 조회	
	public List<MatVO> matOrderChkList();
	//검수자목록
	public List<MatVO> checkerList();
	//자재검사 단건 조회
	public MatVO selectMatCheckInfo(MatVO matVO);
	//자재검사 추가
	public int insertMatCheck(MatVO matVO);
	//자재검사 수정
	public int updateMatCheckInfo(MatVO matVO);
	//자재검사 삭제
	public int deleteMatatCheckInfo(MatVO matVO);
	
	
	
}
