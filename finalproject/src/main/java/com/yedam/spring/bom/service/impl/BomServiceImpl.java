package com.yedam.spring.bom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.bom.mapper.BomMapper;
import com.yedam.spring.bom.service.BomService;

@Service
public class BomServiceImpl implements BomService {
	
	@Autowired
	BomMapper bomMapper;

}
