package com.yedam.spring.production.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderSheetVO {
	// 주문
	private String orderNo;
	private String vendCd;
	private String vendNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;
	private String progAppe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdDt;
	private String orderNm;

	// 주문 디테일
	private String edctsCd;
	private int orderCnt;
	private String prdtNm;
	
	private String bomCd;
	
	private String vendMag;
	private String vendAddr;
}
