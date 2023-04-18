package com.yedam.spring.prcsInsp.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PrcsInspVO {
	//modal창 검사리스트 
	private String indicaCd; //지시코드
	private String prcsCd; //공정코드
	private String prcsNm; //공정명
	private String edctsCd; //제품코드 생산지시테이블 만들면 씀
	private String prdtNm; //제품명 생산지시테이블 만들면 씀
	private int indicaCnt; //검사지시수량
	private int prodCnt; //검사량-불량량 = 생산량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prcsInspDt; //검사일자
	private String prcsInspMng; //검사담당자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctsExpire; //유통기한
	//공정검사기준 
	private String prcsInspCd; //검사코드
	private String prcsInspNm; //검사명
	private String prcsInspStd; //검사기준
	private String prcsInspRst; //검사결과
	private String prcsInspJdg; //판정
	
	//공정검사완료 후 dtl에 넣기
	private String prcsChkCd;//검사완료코드
	//검사완료 후 불량량 넣기
	private int inferCnt; //불량량
	

	
}
