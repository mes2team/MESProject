package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EdctsIstVO {
	private String edctsIstNo;
	private String edctsCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsIstDt;
	private int edctsIstCnt;
	private String edctsLotNo;
	private String edctsLotCnt;
	
	private String prdtNm; // 제품이름
	private String prodCnt; // 생산량
	private String inferCnt; // 불량량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsIstDtEnd; // 날짜 검색할때
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsExpire; // 제품 유통기한
	private String indicaCd; // 생산지시 코드
	private String nowSt; // 생산지시 현재상태
}
