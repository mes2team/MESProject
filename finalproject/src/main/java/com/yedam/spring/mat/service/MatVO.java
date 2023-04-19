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
	private String vendTyp; //거래처유형
	
	private int rscstc; //재고량
	private int istStc; //입고재고량
	private int oustStc; //출고재고량
	private int netStc; //현재재고
	
	private int totalIstCnt; //입고재고(검사완료재고)
    private int totalOustCnt; //출고재고(오늘까지 생산지시 재고)
    private int noIstCnt; // 미입고잔량(발주신청재고-전체검사완료재고)
	
	private String ordrCd; //발주번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt; //발주신청일
	private int ordrCnt; //발주량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt; //납기요청일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clsYymm; //마감년월
	private int prvmmStc; //전월재고
	
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
	private String ordrChk; //진행상태
	
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
	private int cont; // 오염
	private int decay; // 부패
	private int pack; // 포장불량
	private int underWeight; // 중량미달
	private int etc; // 기타
	private String etcExplain; //사유
	
	private String name; //검수자이름
	private String id;	//검수자id
	private String job; //검수자 구분
	
	
}
