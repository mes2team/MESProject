package com.yedam.spring.masterData.mapper;

import java.util.List;

import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.ProPrcsVO;

public interface BomMapper {
	// bom 조회
	public List<BomVO> selectBomList(BomVO vo);

	// 공정 조회
	public List<ProPrcsVO> selectPrcsList();

	// bom 삭제
	public int deleteBom(BomVO vo);

	// bom 저장
	public int saveBom(BomVO vo);

	// bom 자재 검색
	public List<MatVO> selectMatList(MatVO vo);

	// bom 코드 조회
	public BomVO getBomCd(BomVO vo);

	// bom 헤더 등록
	public int insertBomHeader(BomVO vo);
}
