package com.yedam.spring.production.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProPrcsVO {
	//공정관리
	private String prcsCd;
	private String prcsNm;
	private String prcsFg;
	private String prcsCtnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   prcsDt;
	
	//진행공정관리
	private int prefRank;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date indicaDt;
	private String planCd;
	private String wkToTm;
	private String wkFrTm;
	private String prcsPsch;
	private int indicaCnt;
	private int prodCnt;
	private int inferCnt;
	private String prcsStatus;
	private String indicaCd;
	
	//공정흐름
	private int prcsNo;
	private String edctsCd;
	
	private String prdtNm;
	private String bomCd;
	private String rscCd;
	private String rscNm;
	private String useCnt;
	private String rscTyp;
	
	private String useEqm;
	
	private String indicaName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date indicaFdt;
	
	
}
