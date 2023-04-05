package com.yedam.spring.eqm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EqmVO {
	private String eqmCd; //설비코드
	private String eqmFg; //설비구분
	private String eqmNm; //설비명
	@DateTimeFormat(pattern = "yyyy-MM-dd")
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
}
