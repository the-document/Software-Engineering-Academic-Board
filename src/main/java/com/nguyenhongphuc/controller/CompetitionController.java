package com.nguyenhongphuc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenhongphuc.entity.User;

@Controller
@RequestMapping("/competition")
@SessionAttributes("useractive")
public class CompetitionController {

	
	@GetMapping
	public String Default(ModelMap modelMap,HttpSession session) {
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", useractive);
		return "competition";
	}
}
