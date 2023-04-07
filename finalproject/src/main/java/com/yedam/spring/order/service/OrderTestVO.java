package com.yedam.spring.order.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderTestVO {
	
	// 주문
	private String orderNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;
	private String vendCd;
	private String vendNm;
	private String progAppe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdDt;
	private String orderNm;
	
	// 주문 디테일
	private String edctsCd;
	private int orderCnt;
	private String prdtNm;
}
