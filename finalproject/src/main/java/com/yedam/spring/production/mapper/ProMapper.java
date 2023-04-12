package com.yedam.spring.production.mapper;

import java.util.List;


import com.yedam.spring.common.Criteria;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProOrderVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;

public interface ProMapper {

	public int InsertNewPlan(ProPlanVO proPlanArray);

	public ProPlanVO getNextPlanCd();

	public List<OrderSheetVO> selectOrderSheet();

	public List<BomVO> selectBomInfo();
	
	public List<BomVO> selectBomInfo(BomVO vo);

	public List<BomVO> selectBomRscInfo(BomVO vo);

	public int selectProPlanCnt();

	public List<ProPlanVO> selectProPlans(Criteria cri);

	public int deleteProPlan(String planCd);

	public int updateProPlan(ProPlanVO vo);

	public List<OrderSheetVO> selectPrdtInfo();

	public List<ProPrcsVO> selectPrcsList(Criteria cri);

	public int insertPrcs(ProPrcsVO vo);

	public int deletePrcs(String prcsCd);

	public List<ProOrderVO> selectProOrders(Criteria cri);

	public int getProOrderCnt();

	public List<ProPlanVO> selectPlanToOrder();

	public List<BomVO> selectBomStock(BomVO vo);

	public int plusPlanInsert(ProPlanVO proPlanVO);

	public List<BomVO> selectgetRscStock(String edctsCd);

	public int updateOrderStatus(String orderNo);

	

}
