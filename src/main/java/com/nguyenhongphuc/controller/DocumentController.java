package com.nguyenhongphuc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.CatalogService;
import com.nguyenhongphuc.service.DocumentService;
import com.nguyenhongphuc.service.UserService;

@Controller
@RequestMapping("/documents")
@SessionAttributes("useractive")
public class DocumentController {
	private  static int POIN_OF_DOCUMENT=20;

	@Autowired
	CatalogService CatalogService;
	
	@Autowired
	DocumentService documentService;
	
	@Autowired
	UserService userService;
	
	@GetMapping(path = "/{idSubject}")
	public String Default(@PathVariable("idSubject") int idSubject,ModelMap modelMap,HttpSession session) {
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", useractive);
		
		
		Category category = CatalogService.getCategory(idSubject);
		modelMap.addAttribute("subject", category);
		
		List<Document> listTest=documentService.GetTest(idSubject+"");
		modelMap.addAttribute("listTest", listTest);
		
		List<Category> listCategories=CatalogService.getAllCatetory();
		modelMap.addAttribute("listCategories", listCategories);
		
		//System.out.println("\n\nresult\n\n\n"+listTest.get(0).getAuthor());
		return "documentdetail";
	}
	
	
	@GetMapping(path = "/{idSubject}/ajax/{name-type-documents}")
	@ResponseBody
	public List<Document> getDocumentsInSpecialType(@PathVariable("idSubject") String idSubject, @PathVariable("name-type-documents") String type){
		
		List<Document> listdocuments=documentService.getDocumentsInSpecialType(idSubject, type);
	
		return listdocuments;
	}
	
	@GetMapping("/alldoc")
	@ResponseBody
	public List<Document> getAlDocuments(HttpSession session,ModelMap modelMap) {
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", useractive);
		
		List<Document> docs=documentService.getAllDocuments();
		return docs;
	}
	
	@GetMapping(path = "/{idSubject}/download/{idDocument}")
	@ResponseBody
	public String GetDowloadDoc(@PathVariable("idSubject") int idSubject,
			@PathVariable("idDocument") String idDocument,HttpSession session) {
		
		User user=(User) session.getAttribute("useractive");
		if(user!=null) {
			if(user.getPoint()>POIN_OF_DOCUMENT)
			{
				Document doc=documentService.GetDocumentsById(idDocument);
				documentService.UpdateDocument(doc);
				//System.out.println(doc.getUrl());
				user.setPoint(user.getPoint()-POIN_OF_DOCUMENT);
				userService.UpdatePoint(user);
				return doc.getUrl();
			}	
			else {
				return "failscore";
			}
		}
		
		//return "Bạn phải đăng nhập để hoàn thành tác vụ";
		return "faillogin";
	}

	@PostMapping("/upload")
	@ResponseBody
	public String Upload(@RequestParam String type,@RequestParam int category,
			@RequestParam String url,@RequestParam String name,HttpSession session) {
		
		System.out.println("uploading...");
		User user=(User) session.getAttribute("useractive");
		if(user==null)
			return "loginerror";
		
		Document document=new Document();
		document.setName(name);
		document.setType(type);
		document.setAuthor(user);
		
		Category cat=CatalogService.getCategory(category);
		document.setCategory(cat);
		document.setDowloads(0);
		document.setStatus(false);
		document.setUrl(url);
		
		Boolean result=documentService.UploadDocument(document);
		if(result==false)
		return "fail";
		else {
			return "sucess";
		}
	}

	@GetMapping("/upload")
	public String GetUpload() {
		return "testPost";
	}
}
