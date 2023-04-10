package com.yedam.spring.mat.service;

import java.util.List;
import java.util.Map;


public interface MatService {
	//자재목록 전체
	public List<MatVO> matList();
	//자재목록단건조회
	public MatVO getMat(MatVO matVO);
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
}
