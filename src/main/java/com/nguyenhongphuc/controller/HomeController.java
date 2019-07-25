package com.nguyenhongphuc.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.xml.fastinfoset.sax.Properties;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	ServletContext servletContext;
	
	
	@GetMapping
	public String Default(ModelMap modelMap,HttpServletRequest request) {
       
		modelMap.addAttribute("avarta", "/resource/images/user/image.jpg");
		return "home";
	}
}
