package com.yedam.spring.eqm.service;

import java.util.List;

public interface EqmService {
	// 설비전체조회
	public List<EqmVO> selectEqmList();

	// 설비코드최대값
	public EqmVO selectMaxCd();

	// 설비등록
	public int insertEqm(EqmVO eqmVO);

	// 설비단건조회
	public EqmVO selectEqm(EqmVO eqmVO);

	// 삭제
	public int deleteEqm(EqmVO eqmVO);

	// 수정
	public int updateEqm(EqmVO eqmVO);

//////////설비점검내역////////////////

	// 설비점검내역 전체조회
	public List<EqmVO> selectCheckList();

	// 점검검색조회
	public List<EqmVO> searchEqmCheck(EqmVO eqmVO);

	// 점검단건조회
	public EqmVO selectCheck(EqmVO eqmVO);

	// 점검등록
	public int insertCheck(EqmVO eqmVO);

	// 점검삭제
	public int deleteCheck(String checkCd);

	// 점검수정
	public int updateCheck(EqmVO eqmVO);

	/////////// 설비비가동//////////
	// 모달 설비등록 사용여부Y인 설비리스트
	public List<EqmVO> selectYList();

	// 비가동목록조회
	public List<EqmVO> selectOprList();

	// 최대비가동코드
	public EqmVO selectMaxNoprCd();

	// 비가동등록,Y업데이트
	public int insertOprUpdateY(EqmVO eqmVO);

	// 비가동 삭제
	public int deleteOpr(String noprCd);

	// 비가동 수정
	public int updateOpr(EqmVO eqmVO);

	// 등록된 사원들
	public List<EqmVO> selectEmpList();
}
