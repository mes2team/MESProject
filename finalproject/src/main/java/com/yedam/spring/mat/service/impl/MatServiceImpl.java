package com.yedam.spring.mat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.mat.mapper.MatMapper;
import com.yedam.spring.mat.service.MatService;
import com.yedam.spring.mat.service.MatVO;

@Service
public class MatServiceImpl implements MatService {
	
	@Autowired
	MatMapper matMapper;

	@Override
	public int getMatAll() {
		//전체조회
		return matMapper.selectMatAllList();
	}

	@Override
	public List<MatVO> getMatAll(Criteria cri) {
		//페이징 전체조회
		return matMapper.selectMatAllListWithPageing(cri);
	}

	@Override
	public MatVO getMat(MatVO matVO) {
		// 단건조회
		return matMapper.selectMatInfo(matVO);
	}

	@Override
	public int insertMat(MatVO matVO) {
		// 등록
		return matMapper.insertMatInfo(matVO);
	}

	@Override
	public Map<String, String> updateMat(MatVO matVO) {
		// 정보수정
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
	//삭제
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
	

}
