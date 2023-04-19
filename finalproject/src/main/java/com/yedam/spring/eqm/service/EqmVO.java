package com.yedam.spring.eqm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class EqmVO {
	private String eqmCd; //�꽕鍮꾩퐫�뱶
	private String eqmFg; //�꽕鍮꾧뎄遺�
	private String eqmNm; //�꽕鍮꾨챸
	@DateTimeFormat(pattern = "yyyy-MM-dd") //諛쏆쓣�븣 �씠�젃寃�
	private Date eqmIstDt; //�꽕鍮꾩엯怨좊궇吏�
	private String eqmMinTemp; //理쒖냼�삩�룄
	private String eqmMaxTemp; //理쒓퀬�삩�룄
	private String chckPerd; //�젏寃�二쇨린
	private String useYn; //�궗�슜�뿬遺�
	private String eqmMng; // �꽕鍮� �떞�떦�옄
	private String prcsCd; //怨듭젙肄붾뱶
	//private MultipartFile eqmImg;
	
	private String eqmImg; //�뜝�룞�삕�뜝�룞�삕�뜝�떛諭꾩삕�뜝�룞�삕�뜝�룞�삕
	private String eqmImgPath; //�뜝�떛諭꾩삕�뜝�룞�삕�뜝�룞�삕�뜝
	
	//�뜝�룞�삕�뜝�룞�삕�뜝�뙓�벝�삕 �뜝�뙇��媛� �뜝�뙣源띿삕
	private String firstMax; 
	private String secondMax; 
	private String thirdMax; 
	private String fourthMax; 
	private String fifthMax; 
	
	//�꽕鍮꾩젏寃��궡�뿭
	private String checkCd; //�젏寃�肄붾뱶
	private String chckFg; //�젏寃�援щ텇 [�젙湲곗젏寃� | �닔由�]
	@DateTimeFormat(pattern = "yyyy-MM-dd") //
	private Date chckDt; //�젏寃��씪�옄
	private Date nextChckDt; //�떎�쓬�젏寃��씪
	private String jdgmnt; //�뙋�젙
	private String dispoCtnt; //議곗튂�궡�뿭
	private String chckPsch; //�젏寃��떞�떦�옄
	
	//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�떙�냲�삕�뜝�룞�삕 �뜝�룞�삕�쉶�뜝�룞�삕
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	
	//�뜝�룞�삕�뜝�룞�삕�깂�됧뜝
	private String noprCd; //�뜝�룞�삕�뜝�룞�삕�뜝�뙓�벝�삕? �뜝�룦媛��벝�삕�뜝�뙓�벝�삕
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frDt; //�떆�옉�씪�떆
	private String frHm; //�떆�옉�떆媛�
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDt; //醫낅즺�씪�떆
	private String toHm; //醫낅즺�떆媛�
	private String eqmPsch; //鍮꾧��룞�떞�떦�옄
	private String opertCtnt; //�옉�뾽�궡�슜
	
	//�뜝�룞�삕�뜝�룞�삕�뜝 eqm table�뜝�룞�삕 �뜝�룞�삕繹앺슒餓ㅵ뜝�룞�삕
	private String name;
}
