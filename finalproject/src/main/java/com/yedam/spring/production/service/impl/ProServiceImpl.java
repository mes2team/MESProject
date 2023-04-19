package com.yedam.spring.production.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.common.Criteria;
import com.yedam.spring.eqm.service.EqmVO;
import com.yedam.spring.mat.service.MatVO;
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
		if(proMapper.deleteProPlan(planCd) < 0) {
			result ="success";
		} else {
			result ="fail";
		}
		return result;
	}

	@Override
	public String modifyProPlan(ProPlanVO vo) {
		String result = null;
			if(proMapper.updateProPlan(vo) > 0) {
				result ="success";
			} else {
				result ="fail";
			}
			return result;

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

	@Override
	public List<ProPlanVO> getPlanDetail(ProPlanVO vo) {
		return proMapper.selectPlanDetail(vo);
	}

	@Override
	public String checkOrderNo(String planCd) {
		String result = proMapper.checkOrderNo(planCd);
		String[] arr = result.replaceAll("/", "").split("\\s+");
		System.out.println(result);
		System.out.println("ORDERNO : " + arr[0]);
		
		for (String orderNo : arr) {
			proMapper.cancelOrderStatus(orderNo);
		}

		
		return result;
	}

	@Override
	public List<ProPrcsVO> getPrcsFlow(String edctsCd) {
		ProPrcsVO vo = new ProPrcsVO();
		vo.setEdctsCd(edctsCd);
		return proMapper.selectPrcsFlow(vo);
	}

	@Override
	public List<BomVO> getLotStock(String edctsCd) {
		return proMapper.selectLotStock(edctsCd);
	}

	@Override
	public List<BomVO> getLotStk(String rscCd) {
		return proMapper.selectLotStk(rscCd);
	}

	@Override
	public String newProOrderInsert(ProOrderVO proOrderVO) {
		int result = proMapper.InsertNewProOrder(proOrderVO);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}
	}

	@Override
	public List<ProOrderVO> getIndica() {
		return proMapper.selectIndica();
	}

	@Override
	public List<ProPrcsVO> getPrcsProg(ProPrcsVO vo) {
		return proMapper.selectPrcsProg(vo);
	}

	@Override
	public List<ProPrcsVO> getPrcsAndRsc(ProPrcsVO vo) {
		return proMapper.selectPrcsAndRsc(vo);
	}

	@Override
	public List<EqmVO> getEqmPrcs(ProPrcsVO vo) {
		return proMapper.selectEqmPrcs(vo);
	}

	@Override
	public String modifyPrcsStart(ProPrcsVO vo) {
		int result = proMapper.updatePrcsStart(vo);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}
	}

	@Override
	public String modifyUseEqm(String eqmCd) {
		int result = proMapper.updateUseEqm(eqmCd);
		if(result > 0) {
			return "Success";
		} else {
			return "Fail";
		}
	}

	@Override
	public String modifyUseRsc(MatVO matVO) {
		int result = proMapper.updateUseRsc(matVO);
		if(result < 0) {
			return "Success";
		} else {
			return "Fail";
		}
	}

	@Override
	public String modifyPrcsStop(ProPrcsVO vo) {
		int result =  proMapper.updatePrcsStop(vo);
		if(result < 0) {
			String useEqms = proMapper.getEqm(vo);
			String[] arr = useEqms.split("/");
			
			for (String eqmCd : arr) {
				proMapper.offEqm(eqmCd);
			}
			return "Success";
		} else {
			return "Fail";
		}	
	}

	@Override
	public List<ProPlanVO> getPlanToOrder(ProOrderVO vo) {
		return proMapper.selectPlanToOrderChk(vo);
	}

	@Override
	public int preModiPlan(String planCd) {
		return proMapper.preUpdatePlan(planCd) ;

	}
	public List<ProPrcsVO> getPrcsFlowList(ProPrcsVO vo) {
		return proMapper.selectPrcsFlowList(vo);
	}

	@Override
	public List<ProPrcsVO> getPrcsList() {
		return proMapper.getPrcsList();
	}

	@Override
	public int savePrcs(ProPrcsVO vo) {
		return proMapper.savePrcs(vo);
	}

	@Override
	public int deletePrcsFlow(ProPrcsVO vo) {
		return proMapper.deletePrcsFlow(vo);

	}

	@Override
	public List<ProPrcsVO> getPrcsResultList() {
		return proMapper.selectPrcsResultList();
	}

	@Override
	public List<ProPrcsVO> getPrcsAmountList() {
		return proMapper.selectPrcsAmountList();
	}

	@Override
	public List<ProPrcsVO> getPrcsIndica(ProPrcsVO vo) {
		return proMapper.selectPrcsIndica(vo);
	}








	


}
