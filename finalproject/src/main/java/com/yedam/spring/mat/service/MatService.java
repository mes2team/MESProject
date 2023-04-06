package com.yedam.spring.mat.service;

import java.util.List;
import java.util.Map;


public interface MatService {
	//전체 개수
	public List<MatVO> matList();
	//단건조회
	public MatVO getMat(MatVO matVO);
	//등록
	public int insertMat(MatVO matVO);	
	//수정 - 정보수정
	public Map<String, String> updateMat(MatVO matVO);
	//삭제
	public Map<String, String> deleteMat(String rscCd);
}
