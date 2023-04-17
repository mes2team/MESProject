package com.yedam.spring.eqm.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EqmVO {
	private String eqmCd; //�����ڵ�
	private String eqmFg; //���񱸺�
	private String eqmNm; //�����
	@DateTimeFormat(pattern = "yyyy-MM-dd") //������ �̷���
	private Date eqmIstDt; //�����԰�¥
	private String eqmMinTemp; //�ּҿµ�
	private String eqmMaxTemp; //�ְ�µ�
	private String chckPerd; //�����ֱ�
	private String useYn; //��뿩��
	private String eqmMng; // ���� �����
	//private MultipartFile eqmImg;
	
	private String eqmImg; //�����̹�����
	private String eqmImgPath; //�̹������
	
	//�����ڵ� �ִ밪 �ޱ�
	private String firstMax; 
	private String secondMax; 
	private String thirdMax; 
	private String fourthMax; 
	private String fifthMax; 
	
	//�������˳���
	private String checkCd; //�����ڵ�
	private String chckFg; //���˱��� [�������� | ����]
	@DateTimeFormat(pattern = "yyyy-MM-dd") //���� Date�� ���� 2023/04 �������� ���� �װ� ������ ���ϴ�� �ް� ��
	private Date chckDt; //��������
	private String jdgmnt; //����
	private String dispoCtnt; //��ġ����
	private String chckPsch; //���˴����
	
	//�������˳��� ��ȸ��
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end;
	
	//����񰡵�
	private String noprCd; //�����ڵ�? �񰡵��ڵ�
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frDt; //�����Ͻ�
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDt; //�����Ͻ�
	private String eqmPsch; //�񰡵������
	private String opertCtnt; //�۾�����
	
	//����� eqm table�� ��ϵȾֵ��
	private String name;
	private String prcsCd;
}
