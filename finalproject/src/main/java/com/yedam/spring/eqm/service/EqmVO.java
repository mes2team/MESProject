package com.yedam.spring.eqm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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
	private String prcsCd; //공정코드
	//private MultipartFile eqmImg;
	
	private String eqmImg; //占쏙옙占쏙옙占싱뱄옙占쏙옙占쏙옙
	private String eqmImgPath; //占싱뱄옙占쏙옙占쏙옙占
	
	//占쏙옙占쏙옙占쌘듸옙 占쌍대값 占쌨깍옙
	private String firstMax; 
	private String secondMax; 
	private String thirdMax; 
	private String fourthMax; 
	private String fifthMax; 
	
	//설비점검내역
	private String checkCd; //점검코드
	private String chckFg; //점검구분 [정기점검 | 수리]
	@DateTimeFormat(pattern = "yyyy-MM-dd") //
	private Date chckDt; //점검일자
	private Date nextChckDt; //다음점검일
	private String jdgmnt; //판정
	private String dispoCtnt; //조치내역
	private String chckPsch; //점검담당자
	
	//占쏙옙占쏙옙占쏙옙占싯놂옙占쏙옙 占쏙옙회占쏙옙
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	
	//占쏙옙占쏙옙胄〉占
	private String noprCd; //占쏙옙占쏙옙占쌘듸옙? 占쏟가듸옙占쌘듸옙
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frDt; //시작일시
	private String frHm; //시작시간
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDt; //종료일시
	private String toHm; //종료시간
	private String eqmPsch; //비가동담당자
	private String opertCtnt; //작업내용
	
	//占쏙옙占쏙옙占 eqm table占쏙옙 占쏙옙溝횡令占쏙옙
	private String name;
	private String prcsCd;
}
