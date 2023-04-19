package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class FinishedPrdVO {

	// 입고 VO
	private String edctsIstNo;
	private String edctsCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsIstDt;
	private int edctsIstCnt;
	private String edctsLotNo;
	private String edctsLotCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsExpire;

	// 제품 VO
	private String prdtNm;
	private String spec;
	private String unit;
	private int safStc;
}
