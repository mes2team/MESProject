package com.yedam.spring.emp.service;

import java.util.List;
import java.util.Map;

import com.yedam.spring.common.Criteria;

public interface EmpService {
	//전체 개수
	public int getEmpAll();
	//전체조회 + 페이징
	public List<EmpVO> getEmpAll(Criteria cri);
	//단건조회
	public EmpVO getEmp(EmpVO empVO);
	//등록
	public int insertEmp(EmpVO empVO);
	//수정 - 급여수정
	public String updateEmpSal(int empId, int raise);
	//수정 - 정보수정
	public Map<String, String> updateEmp(EmpVO empVO);
	//삭제
	public Map<String, String> deleteEmp(int empId);
}
