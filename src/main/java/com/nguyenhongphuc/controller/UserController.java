package com.nguyenhongphuc.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.User;

@RequestMapping("/user")
public class UserController {
	
	@PostMapping("/register")
	@ResponseBody
	public User Register() {
		User user =new User();
		return user;
		//return null;
	}
}
