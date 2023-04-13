package com.yedam.spring.sales.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.EdctsOustMapper;
import com.yedam.spring.sales.service.EdctsOustService;

@Service
public class EdctsOustServiceImpl implements EdctsOustService {
	
	@Autowired
	EdctsOustMapper edctsoustMapper;

}
