package com.nguyenhongphuc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.query.spi.sql.NativeSQLQueryCollectionReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.CatalogService;

@Controller
@RequestMapping("/documents")
@SessionAttributes("useractive")
public class CatagoryController {

	@Autowired
	CatalogService CatalogService;
	
	@GetMapping
	public String Default(ModelMap modelMap,HttpServletRequest request) {
		
		modelMap.clear();	
		User user=(User) request.getSession().getAttribute("useractive");
		modelMap.addAttribute("useractive", user);
		if (user==null) {
			System.out.println("NULL");
		}
		else System.out.println(" NOT NULL");
			
		
		List<Category> listsCategories=CatalogService.getDefaultCategory();
		
		modelMap.addAttribute("listSubjectDefault", listsCategories);
		
		
		return "documents";
	}
	
	@GetMapping(path = "/ajax/{namescope}")
	@ResponseBody
	public List<Category> GetCatalogInMajor(@PathVariable("namescope") String namescope) {
		
		List<Category> listsCategories=CatalogService.getCategoryFor(namescope);	
		
		return listsCategories;
	}
	
	@GetMapping("/allcategory")
	@ResponseBody
	public List<Category> getAllCategory() {
		List<Category> categorys=CatalogService.getAllCatetory();
		return categorys;
	}
}
