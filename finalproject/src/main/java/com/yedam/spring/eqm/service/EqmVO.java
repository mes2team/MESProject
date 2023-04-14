package com.yedam.spring.eqm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EqmVO {
	private String eqmCd; //설비코드
	private String eqmFg; //설비구분
	private String eqmNm; //설비명
	@DateTimeFormat(pattern = "yyyy-MM-dd") //받을때 이렇게
	private Date eqmIstDt; //설비입고날짜
	private String eqmMinTemp; //최소온도
	private String eqmMaxTemp; //최고온도
	private String chckPerd; //점검주기
	private String useYn; //사용여부
	private String eqmMng; // 설비 담당자
	private String eqmImg; //설비이미지
	
	//설비코드 최대값 받기
	private String firstMax; 
	private String secondMax; 
	private String thirdMax; 
	private String fourthMax; 
	private String fifthMax; 
	
	//설비점검내역
	private String checkCd; //점검코드
	private String chckFg; //점검구분 [정기점검 | 수리]
	@DateTimeFormat(pattern = "yyyy-MM-dd") //밑의 Date는 원래 2023/04 슬래쉬로 받음 그걸 지정한 패턴대로 받게 함
	private Date chckDt; //점검일자
	private String jdgmnt; //판정
	private String dispoCtnt; //조치내역
	private String chckPsch; //점검담당자
	
	//설비점검내역 조회용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end;
	
	//설비비가동
	private String noprCd; //점검코드? 비가동코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frDt; //시작일시
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDt; //종료일시
	private String eqmPsch; //비가동담당자
	private String opertCtnt; //작업내용
	
	//담당자 eqm table에 등록된애들로
	private String name;
}
