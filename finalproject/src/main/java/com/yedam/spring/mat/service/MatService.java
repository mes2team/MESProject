package com.yedam.spring.mat.service;

import java.util.List;
import java.util.Map;


public interface MatService {
	//자재목록 전체
	public List<MatVO> matList();
	//자재목록단건조회
	public MatVO getMat(MatVO matVO);
	//사용하는 자재목록 전체
	public List<MatVO> matUseList();
	//자재거래처 전체조회
	public List<MatVO> matVendList();
	//자재목록등록
	public int insertMat(MatVO matVO);	
	//자재목록 수정
	public Map<String, String> updateMat(MatVO matVO);
	//자재목록 삭제
	public Map<String, String> deleteMat(String rscCd);
	
	//자재발주 전체
	public List<MatVO> matOrderList();
	//자재발주 단건조회
	public MatVO getMatOrderInfo(MatVO matVO);
	//자재발주 등록
	public int addMatOrderInfo(MatVO matVO);	
	//자재발주 수정
	public int updatematOrder(MatVO matVO);
	//자재발주 삭제
	public int removeMatOrder(String ordrCd);
	
	//자재재고현황
	public List<MatVO> matStock();
	
	//자재입고 현황
	public List<MatVO> matReceiptList();
	//입고미완료 발주 전체 조회
	public List<MatVO> matReceiptChkList();
	//자재입고 단건 조회
	public MatVO getMatReceiptInfo(MatVO matVO);
	//자재입고 추가
	public int addMatReceipt(MatVO matVO);
	//자재입고 수정
	public int updateMatReceipt(MatVO matVO);
	//자재발주 삭제
	public int removeMatReceipt(MatVO matVO);
	
	//자재검사목록
	public List<MatVO> matCheckList();
	//검사미완료 발주 전체 조회
	public List<MatVO> matOrderChkList();
	//검수자 목록 조회
	public List<MatVO> checkerList();
	//자재검사 단건 조회
	public MatVO getMatCheckInfo(MatVO matVO);
	//자재검사 추가
	public int addMatCheck(MatVO matVO);
	//자재검사 수정
	public int updateMatCheckInfo(MatVO matVO);
	//자재검사 삭제
	public int removeMatatCheckInfo(MatVO matVO);
	
		
}
