package com.hutianyi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hutianyi.service.IndexServiceImpl;

@Controller
public class IndextController {
	
	@Autowired
	IndexServiceImpl indexServiceImpl;
	
	@RequestMapping("manager_index")
	public String index() {
		
		return "manager_index";
	}

}
