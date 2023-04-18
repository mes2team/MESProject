package com.yedam.spring.production.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProOrderVO {
	//생산지시
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date indicaDt;
	private String planCd;
	private String nowSt;
	private String indicaCd;
	private String indicaName;
	//생산지시디테일
	private int orderCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wkToDt;
	private int indicaCnt;
	private String edctsCd;
	private String bomCd;
	
	private String planName;
	private String prdtNm;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date indicaDue;
}
