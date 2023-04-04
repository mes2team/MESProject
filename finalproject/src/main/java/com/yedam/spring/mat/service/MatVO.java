package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatVO {
	private String rscCd;
	private String rscNm;
	private String rscSpec;
	private String mngUnit;
	private String rscTyp;
	private double safStc;
	private String useYn;
	private String vendCd;
	
	private int rscStc;
	private int baseStc; 
	private int avalStc;
	
	private String ordrCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt;
	private int ordrCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clsYymm;
	private int prvmmStc;
	
	
}
