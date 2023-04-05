package com.yedam.spring.production.mapper;

import java.util.List;

import com.yedam.spring.production.service.BomVO;
import com.yedam.spring.production.service.OrderSheetVO;
import com.yedam.spring.production.service.ProPlanVO;

public interface ProMapper {

	public int InsertNewPlan(ProPlanVO vo);

	public ProPlanVO getNextPlanCd();

	public List<OrderSheetVO> selectOrderSheet();

	public List<BomVO> selectBomInfo();

	public List<BomVO> selectBomRscInfo(BomVO vo);

}
