package com.nguyenhongphuc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/infor-api")
public class InforAPIController {

	@GetMapping
	public String Default() {
		return "inforapi";
	}
}
