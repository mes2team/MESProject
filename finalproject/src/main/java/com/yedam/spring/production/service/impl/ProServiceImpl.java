package com.yedam.spring.production.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.production.mapper.ProMapper;
import com.yedam.spring.production.service.ProService;
@Service
public class ProServiceImpl implements ProService {
	
	@Autowired
	ProMapper proMapper;
}
