package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatInOutVO {
	private String istCd; //입고코드
	private int istCnt; //입고수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date istDt; //입고일자
	
	private String  rscLotCd; //LOT번호 
	private int lotCnt; //LOT수량
	private int lotRmnCnt; //LOT잔량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expDt;  //유통기한
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date oustDt; //출고일자
	private int oustCnt; //출고수량
}
