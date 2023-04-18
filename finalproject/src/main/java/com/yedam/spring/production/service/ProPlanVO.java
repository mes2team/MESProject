package com.yedam.spring.production.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProPlanVO {
	//생산계획
	private String planCd;	//생산계획코드
	private String planName;	//생산계획명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdDt;	//납기일자
	private String nowSt;	//현재상황
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planDt;	//생산계획일자
	private String orderNo;	//주문번호
	//생산계획 디테일
	private int	prefRank;	//작업우선순위
	private	String edctsCd;	//제품코드
	private	String bomCd;	//BOM코드
	private	String	orderCnt;	//주문수량
	private	int	indicaCnt = 0;	//생산지시수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private	Date wkToDt;	//생산시작예정일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wkFrDt;	//생산종료일자
	
	private String prdtNm;	//제품명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date firstDate;	//조건시작
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lastDate;	//조건마지막
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date planDue;
}
