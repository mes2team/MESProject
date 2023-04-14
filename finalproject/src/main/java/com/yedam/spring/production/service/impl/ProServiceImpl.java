package com.yedam.spring.production.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.production.mapper.ProMapper;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProOrderVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;
import com.yedam.spring.production.service.ProService;
@Service
public class ProServiceImpl implements ProService {
	
	@Autowired
	ProMapper proMapper;
	
	@Override
	public String plusPlanInsert(ProPlanVO proPlanVO) {
		int result = proMapper.plusPlanInsert(proPlanVO);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}
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

	@Override
	public List<ProOrderVO> getProOrders(Criteria cri) {
		return proMapper.selectProOrders(cri);
	}

	@Override
	public int getProOrderCnt() {
		return proMapper.getProOrderCnt();
	}

	@Override
	public List<ProPlanVO> getPlanToOrder() {
		return proMapper.selectPlanToOrder();
	}

	@Override
	public List<BomVO> getBomStock(BomVO vo) {
		return proMapper.selectBomStock(vo);
	}

	@Override
	public List<BomVO> getRscStock(String edctsCd) {
		return proMapper.selectgetRscStock(edctsCd);
	}

	@Override
	public String newPlanInsert(ProPlanVO proPlanArray) {
		int result = proMapper.InsertNewPlan(proPlanArray);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}
		
	}

	@Override
	public String modifyOrderStatus(String orderNo) {
		int result = proMapper.updateOrderStatus(orderNo);
		if(result > 0) {
			return orderNo;
		} else {
			return orderNo + "Fail";
		}
	}

	@Override
	public int getProPlanCnt(ProPlanVO vo) {
		return proMapper.selectProPlanCnt(vo);
	}

	@Override
	public List<ProPrcsVO> getPrcsFlow(ProPrcsVO vo) {
		return proMapper.selectPrcsFlow(vo);
	}






	


}
