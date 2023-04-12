package com.yedam.spring.prcsInsp.service;

import lombok.Data;

@Data
public class PrcsInspVO {
	//modal창 검사리스트 
	private String prcsCd; //공정코드
	private String prcsNm; //공정명
	private String edctsCd; //제품코드 생산지시테이블 만들면 씀
	private String prdtNm; //제품명 생산지시테이블 만들면 씀
	private int prodCnt; //생산량==검사량
	//max 완제품lot
	private String edctsLotNo;
	
}
