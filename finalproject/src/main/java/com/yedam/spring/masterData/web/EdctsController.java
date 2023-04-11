package com.yedam.spring.masterData.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.spring.masterData.service.EdctsService;

@Controller
public class EdctsController {
	@Autowired
	EdctsService edctsService;
}
