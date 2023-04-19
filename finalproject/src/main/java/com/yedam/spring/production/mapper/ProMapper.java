package com.yedam.spring.production.mapper;

import java.util.List;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.eqm.service.EqmVO;
import com.yedam.spring.mat.service.MatVO;
import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProOrderVO;
import com.yedam.spring.production.service.ProPlanVO;
import com.yedam.spring.production.service.ProPrcsVO;

public interface ProMapper {

	public int InsertNewPlan(ProPlanVO proPlanArray);

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

	public int selectSearchProPlanCnt();

	public int selectProPlanCnt(ProPlanVO vo);

	public List<ProPrcsVO> selectPrcsFlow(ProPrcsVO vo);

	public List<ProPlanVO> selectPlanDetail(ProPlanVO vo);

	public String checkOrderNo(String planCd);

	public int cancelOrderStatus(String orderNo);

	public List<BomVO> selectLotStock(String edctsCd);

	public List<BomVO> selectLotStk(String rscCd);

	public int InsertNewProOrder(ProOrderVO proOrderVO);

	public List<ProOrderVO> selectIndica();

	public List<ProPrcsVO> selectPrcsProg(ProPrcsVO vo);

	public List<ProPrcsVO> selectPrcsAndRsc(ProPrcsVO vo);

	public List<EqmVO> selectEqmPrcs(ProPrcsVO vo);

	public int updatePrcsStart(ProPrcsVO vo);

	public int updateUseEqm(String eqmCd);

	public int updateUseRsc(MatVO matVO);

	public int updatePrcsStop(ProPrcsVO vo);

	public String getEqm(ProPrcsVO vo);

	public int offEqm(String eqmCd);


	public List<ProPlanVO> selectPlanToOrderChk(ProOrderVO vo);

	public int preUpdatePlan(String planCd);

	// 공정흐름관리 공정흐름출력
	public List<ProPrcsVO> selectPrcsFlowList(ProPrcsVO vo);

	// 공정조회
	public List<ProPrcsVO> getPrcsList();

	// 공정저장
	public int savePrcs(ProPrcsVO vo);

	// 공정삭제
	public int deletePrcsFlow(ProPrcsVO vo);
	//
	public List<ProPrcsVO> selectPrcsResultList();

	public List<ProPrcsVO> selectPrcsAmountList();

	public List<ProPrcsVO> selectPrcsIndica(ProPrcsVO vo);


}
