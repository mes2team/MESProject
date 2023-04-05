package com.yedam.spring.production.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderSheetVO {
	private String orderNo;
	private String edctsCd;
	private String vendCd;
	private String vendNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;
	private String progAppe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdDt;
	private String prdtNm;
	private int orderCnt;
	
}
