package com.nguyenhongphuc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.CatalogService;
import com.nguyenhongphuc.service.DocumentService;
import com.nguyenhongphuc.service.UserService;

@Controller
@RequestMapping("/documents")
public class DocumentController {
	private  static int POIN_OF_DOCUMENT=20;

	@Autowired
	CatalogService CatalogService;
	
	@Autowired
	DocumentService documentService;
	
	@Autowired
	UserService userService;
	
	@GetMapping(path = "/{idSubject}")
	public String Default(@PathVariable("idSubject") int idSubject,ModelMap modelMap) {
		
		Category category = CatalogService.getCategory(idSubject);
		modelMap.addAttribute("subject", category);
		
		List<Document> listTest=documentService.GetTest(idSubject+"");
		modelMap.addAttribute("listTest", listTest);
		
		//System.out.println("\n\nresult\n\n\n"+listTest.get(0).getAuthor());
		return "documentdetail";
	}
	
	
	@GetMapping(path = "/{idSubject}/ajax/{name-type-documents}")
	@ResponseBody
	public List<Document> getDocumentsInSpecialType(@PathVariable("idSubject") int idSubject, @PathVariable("name-type-documents") String type){
		
		List<Document> listdocuments=documentService.getDocumentsInSpecialType(idSubject+"", type);
	
		return listdocuments;
	}
	
	@GetMapping(path = "/{idSubject}/download/{idDocument}")
	public String Default(@PathVariable("idSubject") int idSubject,
			@PathVariable("idDocument") String idDocument,HttpSession session) {
		
		User user=(User) session.getAttribute("user");
		if(user!=null) {
			if(user.getPoint()>POIN_OF_DOCUMENT)
			{
				Document doc=documentService.GetDocumentsById(idDocument);
				//System.out.println(doc.getUrl());
				user.setPoint(user.getPoint()-POIN_OF_DOCUMENT);
				userService.UpdatePoint(user);
				return "redirect:"+doc.getUrl();
			}			
		}
		
		//return "Bạn phải đăng nhập để hoàn thành tác vụ";
		return "redirect:/documents/"+idSubject;
	}
}
