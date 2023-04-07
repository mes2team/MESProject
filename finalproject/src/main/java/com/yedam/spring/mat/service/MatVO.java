package com.yedam.spring.mat.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MatVO {
	private String rscCd; //자재코드
	private String rscNm; //자재명
	private String rscSpec; //자재규격
	private String mngUnit; //관리단위
	private String rscTyp; //자재유형
	private double safStc; //안전재고
	private String useYn; //사용여부
	private String vendCd; //거래처코드
	private String vendNm; //거래처이름
	
	private int rscStc;
	private int baseStc; 
	private int avalStc;
	
	private String ordrCd; //발주번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt; //발주신청일
	private int ordrCnt; //발주량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt; //납기요청일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clsYymm;
	private int prvmmStc;
	
	
}
