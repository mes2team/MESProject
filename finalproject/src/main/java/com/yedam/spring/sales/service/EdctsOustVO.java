package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EdctsOustVO {
	private String edctsOustNo;
	private String edctsCd;
	private String edctsLotNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsOustDt;
	private int edctsOustCnt;
	private String orderNo;
	
	// 제품이름
	private String prdtNm;
	private int edctsLotCnt;
}
