package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatInOutVO {
	private String istCd;
	private int istCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date istDt;
	
	private String  rscLotCd;
	private int lotCnt;
	private int lotRmnCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expDt;  
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date oustDt;
	private int oustCnt;
}
