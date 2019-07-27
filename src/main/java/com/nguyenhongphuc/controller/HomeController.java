package com.nguyenhongphuc.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.service.PostService;
import com.sun.xml.fastinfoset.sax.Properties;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	PostService postService;
	
	@GetMapping
	public String Default(ModelMap modelMap,HttpServletRequest request) {
       
		List<Post> shares=postService.Get5LatestShare();
		List<Post> events=postService.GetLatestEvents();
		List<Post> tutorials=postService.Get4LatestTutorial();
		
		modelMap.addAttribute("shares", shares);
		modelMap.addAttribute("events", events);
		modelMap.addAttribute("tutorials", tutorials);
		return "home";
	}
}
