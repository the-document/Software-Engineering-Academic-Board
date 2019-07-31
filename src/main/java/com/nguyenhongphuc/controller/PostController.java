package com.nguyenhongphuc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping(path = "/detail/{id}")
	public String DetailPost(@PathVariable("id") String id, ModelMap modelMap) {
		modelMap.clear();
		
		Post post =postService.GetPostById(id);
		
		modelMap.addAttribute("post", post);
		
		
		return "postdetail";
	}

}
