package com.yedam.spring.mat.mapper;

import java.util.List;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.mat.service.MatVO;

public interface MatMapper {
	//전체 개수
	public int selectMatAllList();
	//전체 조회 + 페이징
	public List<MatVO> selectMatAllListWithPageing(Criteria cri);
	
	
	//단건 조회
	public MatVO selectMatInfo(MatVO matVO);
	//등록
	public int insertEmpInfo(MatVO matVO);

	//수정 - 사원 정보 수정
	public int updateMatInfo(MatVO matVO);
	//삭제
	public int deleteMatInfo(String rscCd);
}
