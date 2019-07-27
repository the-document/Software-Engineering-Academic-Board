package com.nguyenhongphuc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.service.PostService;

@Controller
@RequestMapping("/posts")
public class PostController {
	
	@Autowired
	PostService postService;

	@GetMapping
	public String Default(ModelMap modelMap) {
		//return home posts.
		
		
		return "post";
	}

}
