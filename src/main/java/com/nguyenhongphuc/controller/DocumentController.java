package com.nguyenhongphuc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.service.CatalogService;
import com.nguyenhongphuc.service.DocumentService;

@Controller
@RequestMapping("/documents")
public class DocumentController {

	@Autowired
	CatalogService CatalogService;
	
	@Autowired
	DocumentService documentService;
	
	@GetMapping(path = "/{idSubject}")
	public String Default(@PathVariable("idSubject") int idSubject,ModelMap modelMap) {
		
		Category category = CatalogService.getCategory(idSubject);
		modelMap.addAttribute("subject", category);
		
		List<Document> listTest=documentService.GetTest(idSubject+"");
		modelMap.addAttribute("listTest", listTest);
		
		//System.out.println("\n\nresult\n\n\n"+listTest.toString());
		return "documentdetail";
	}
	
	
	@GetMapping(path = "/{idSubject}/ajax/{name-type-documents}")
	@ResponseBody
	public List<Document> getDocumentsInSpecialType(@PathVariable("idSubject") int idSubject, @PathVariable("name-type-documents") String type){
		
		List<Document> listdocuments=documentService.getDocumentsInSpecialType(idSubject+"", type);
	
		return listdocuments;
	}
}
