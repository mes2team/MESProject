package com.yedam.spring.production.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.production.mapper.ProMapper;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;
import com.yedam.spring.production.service.ProService;
@Service
public class ProServiceImpl implements ProService {
	
	@Autowired
	ProMapper proMapper;

	@Override
	public String newPlanInsert(ProPlanVO vo) {
		int result = proMapper.InsertNewPlan(vo);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}

	}

	@Override
	public String getNextPlanCd() {
		int PlanCd = 0;
		String NextPlanCd = null;
		if( proMapper.getNextPlanCd() == null) {
			NextPlanCd = "PLN1000";
		} else {		
			PlanCd = Integer.parseInt(proMapper.getNextPlanCd().getPlanCd().substring(3)) + 1 ;
			NextPlanCd = "PLN" + PlanCd;
		}
		return NextPlanCd;
	}

	@Override
	public List<OrderSheetVO> getOrdSheet() {
		return proMapper.selectOrderSheet();
	}

	@Override
	public List<BomVO> getBomInfo() {
		return proMapper.selectBomInfo();
	}
	
	@Override
	public List<BomVO> getBomInfo(BomVO vo) {
		return proMapper.selectBomInfo(vo);
	}


	@Override
	public List<BomVO> getBomRscInfo(BomVO vo) {
		return proMapper.selectBomRscInfo(vo);
	}

	@Override
	public int getProPlanCnt() {
		return proMapper.selectProPlanCnt();
	}

	@Override
	public List<ProPlanVO> getProPlans(Criteria cri) {
		return proMapper.selectProPlans(cri);
	}

	@Override
	public String removePlan(String planCd) {
		String result = null;
		if(proMapper.deleteProPlan(planCd) > 0) {
			result ="success";
		} else {
			result ="fail";
		}
		return result;
	}

	@Override
	public int modifyProPlan(ProPlanVO vo) {
		return proMapper.updateProPlan(vo);
	}

	@Override
	public List<OrderSheetVO> getprdtInfo() {
		return proMapper.selectPrdtInfo();
	}

	@Override
	public List<ProPrcsVO> getprcsList(Criteria cri) {
		return proMapper.selectPrcsList(cri);
	}

	@Override
	public String addPrcs(ProPrcsVO vo) {
		int result = proMapper.insertPrcs(vo);
		if(result > 0) {
			return "Success";
		} else {
			return "Fail";
		}

	}

	@Override
	public String removePrcs(String prcsCd) {
		int result = proMapper.deletePrcs(prcsCd);
		if(result > 0) {
			return "Success";
		} else {
			return "Fail";
		}
	}


}
