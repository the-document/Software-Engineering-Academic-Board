package com.nguyenhongphuc.controller;

import java.util.List;

import org.hibernate.engine.query.spi.sql.NativeSQLQueryCollectionReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.service.CatalogService;

@Controller
@RequestMapping("/documents")
public class CatagoryController {

	@Autowired
	CatalogService CatalogService;
	
	@GetMapping
	public String Default(ModelMap modelMap) {
		
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
	
}
