package com.nguyenhongphuc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.service.DocumentService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	DocumentService documentService;
	
	@GetMapping("/browsedoc")
	@ResponseBody
	public List<Document> GetBrowse() {
		List<Document> docsList=documentService.getAllDocumentsUnapproved();
		return docsList;
	}
}
