package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatCheckVO {
	
	private String rscInspCd; //검사코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inspDt; //검사일자
	private String inspTstr;	//검사자
	private int inspCnt; //검사수량
	private int inspPassCnt; //합격수량
	private int inspFailCnt; //불량수량
	private int bool; //입고마감
	
	private String infCd; //불량코드
	private int infNm; // 불량명
}
