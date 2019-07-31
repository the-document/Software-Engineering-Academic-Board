package com.nguyenhongphuc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/competition")
public class CompetitionController {

	
	@GetMapping
	public String Default() {
		return "competition";
	}
}
