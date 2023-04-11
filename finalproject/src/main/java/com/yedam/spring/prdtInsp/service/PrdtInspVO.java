package com.yedam.spring.prdtInsp.service;

import lombok.Data;

@Data
public class PrdtInspVO {
	//modal창 주문서용
	private String orderNo; //주문번호
	private String vendNm; //거래처명
	private String edctsCd; //완제품코드
	private String prdtNm; //완제품이름
	private int orderCnt; //주문수량
	
	//max 완제품lot
	private String edctsLotNo;
	
}
