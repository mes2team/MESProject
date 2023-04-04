package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatCheckVO {
	
	private String rscInspCd; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inspDt;
	private String inspTstr;	
	private int inspCnt;
	private int inspPassCnt;
	private int inspFailCnt;
	private int bool;
	
	private String infCd;
	private int infCnt; 
}
