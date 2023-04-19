package com.yedam.spring.mat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.mat.mapper.MatMapper;
import com.yedam.spring.mat.service.MatService;
import com.yedam.spring.mat.service.MatVO;

@Service
public class MatServiceImpl implements MatService {
	
	@Autowired
	MatMapper matMapper;
	
	@Override
	public List<MatVO> matList() {
		// 자재목록 전체조회
		return matMapper.matList();
	}
	@Override
	public MatVO getMat(MatVO matVO) {
		// 자재목록 단건조회
		return matMapper.selectMatInfo(matVO);
	}
	@Override
	public List<MatVO> matUseList() {
		//사용하는 자재목록 전체
		return matMapper.matUseList();
	}
	@Override
	public List<MatVO> matVendList() {
		// //자재거래처 전체조회
		return matMapper.matVendList();
	}
	@Override
	public int insertMat(MatVO matVO) {
		// 자재목록 등록
		return matMapper.insertMatInfo(matVO);
	}
	@Override
	public Map<String, String> updateMat(MatVO matVO) {
		// 자재목록 정보수정
		Map<String, String> map = new HashMap<>();
		map.put("자재코드", String.valueOf(matVO.getRscCd()));
		int result = matMapper.updateMatInfo(matVO);
		if(result == 1) {
			map.put("결과", "Success");
		} else {
			map.put("결과", "Fail");
		}
		return map;
	}
	// 자재목록삭제
	@Override
	public Map<String, String> deleteMat(String rscCd) {
		Map<String, String> map = new HashMap<>();
		map.put("사원번호", String.valueOf(rscCd));
		int result = matMapper.deleteMatInfo(rscCd);
		if(result == 1) {
			map.put("결과", "Success");
		} else {
			map.put("결과", "Fail");
		}
				return map;
	}
	
	@Override
	public List<MatVO> matOrderList() {
		//발주 전체 조회
		return matMapper.matOrderAllList();
	}
	@Override
	public MatVO getMatOrderInfo(MatVO matVO) {
		//자재발주 단건 조회
		return matMapper.selectMatOrderInfo(matVO);
	}
	@Override
	public int addMatOrderInfo(MatVO matVO) {
		//자재발주 등록
		return matMapper.insertMatOrderInfo(matVO);
	}
	@Override
	public int updatematOrder(MatVO matVO) {
		//자재발주 수정
		return matMapper.updateMatOrderInfo(matVO);
	}
	@Override
	public int removeMatOrder(String ordrCd) {
		//자재발주 삭제
		return matMapper.deleteMatOrderInfo(ordrCd);
	}
	
	@Override
	public List<MatVO> matStock() {
		// //자재재고현황
		return matMapper.matStockList();
	}
	
	@Override
	public List<MatVO> matReceiptList() {
		//자재입고 현황
		return matMapper.matReceiptList();
	}
	@Override
	public List<MatVO> matReceiptChkList() {
		// 입고 미완료 조회
		return matMapper.matReceiptChkList();
	}
	@Override
	public MatVO getMatReceiptInfo(MatVO matVO) {
		//자재입고 단건 조회
		return matMapper.selectMatReceiptInfo(matVO);
	}
	@Override
	public int addMatReceipt(MatVO matVO) {
		//자재입고 추가
		return matMapper.insertMatReceipt(matVO);
	}
	@Override
	public int updateMatReceipt(MatVO matVO) {
		//자재입고 수정
		return matMapper.updateMatReceiptInfo(matVO);
	}
	@Override
	public int removeMatReceipt(MatVO matVO) {
		//자재입고 삭제
		return matMapper.deleteMatReceiptInfo(matVO);
	}
	
	@Override
	public List<MatVO> matCheckList() {
		//자재검사목록
		return matMapper.matCheckList();
	}
	@Override
	public MatVO getMatCheckInfo(MatVO matVO) {
		//자재검사 단건 조회
		return matMapper.selectMatCheckInfo(matVO);
	}
	@Override
	public int addMatCheck(MatVO matVO) {
		//자재검사 추가
		return matMapper.insertMatCheck(matVO);
	}
	@Override
	public int updateMatCheckInfo(MatVO matVO) {
		//자재검사 수정
		return matMapper.updateMatCheckInfo(matVO);
	}
	@Override
	public int removeMatatCheckInfo(MatVO matVO) {
		//자재검사 삭제
		return matMapper.deleteMatatCheckInfo(matVO);
	}
	@Override
	public List<MatVO> matOrderChkList() {
		// 검사미완료 발주 전체 조회
		return matMapper.matOrderChkList();
	}
	@Override
	public List<MatVO> checkerList() {
		// 검수자 목록 조회
		return matMapper.checkerList();
	}

}
