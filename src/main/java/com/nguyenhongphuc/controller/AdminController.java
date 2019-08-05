package com.nguyenhongphuc.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.BrowsePostService;
import com.nguyenhongphuc.service.DocumentService;
import com.nguyenhongphuc.service.PostService;
import com.nguyenhongphuc.service.UserService;
import com.nguyenhongphuc.entity.BrowsePost;

@Controller
@RequestMapping("/admin")
@SessionAttributes("useractive")
public class AdminController {
	public static int POINT_PER_POST=20;
	
	@Autowired
	DocumentService documentService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	UserService UserService;
	
	@Autowired
	BrowsePostService browsePostService;
	
	@GetMapping
	public String Default(ModelMap modelMap, HttpSession session) {
		
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		if(useractive!=null) {
			String position=useractive.getPosition();
			if(position.equals("admin")||position.equals("censor")) {
				List<Document> docsList=documentService.getAllDocumentsUnapproved();
				modelMap.addAttribute("docList", docsList);
				
				return "adminDoc";
			}
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/documents")
	public String GetBrowse(ModelMap modelMap, HttpSession session) {
		
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		if(useractive!=null) {
			String position=useractive.getPosition();
			if(position.equals("admin")||position.equals("censor")) {
				List<Document> docsList=documentService.getAllDocumentsUnapproved();
				modelMap.addAttribute("docList", docsList);
				
				return "adminDoc";
			}
		}
		
		return "redirect:/";
	}
	
	@PostMapping(path = "/documents/browse")
	@ResponseBody
	public String BrowseDocument(@RequestParam String id,@RequestParam String docName, @RequestParam String Url) {
		
		Document document=documentService.GetDocumentsById(id);
		document.setName(docName);
		document.setUrl(Url);
		document.setStatus(true);
		
		Boolean bool=documentService.UpdateDocument(document);
		if(bool)
			return "success";
		
		return "fail";
	}
	
	
	//post============================
	@GetMapping("/posts")
	public String GetViewBrowPost(ModelMap modelMap, HttpSession session) {
		
		modelMap.clear();
		User useractive=(User) session.getAttribute("useractive");
		if(useractive!=null) {
			String position=useractive.getPosition();
			if(position.equals("admin")||position.equals("censor")) {
				List<Post> postList=postService.GetPostsUnActive();
				modelMap.addAttribute("postList", postList);
				
				return "adminPost";
			}
		}
		
		return "redirect:/";
	}

	
	@PostMapping(path = "/posts/browse")
	@ResponseBody
	public String BrowsePost(@RequestParam String id,HttpSession httpSession) {
		
		Post post=postService.GetPostPreview(id);
		post.setPoststatus(true);
		Boolean bool=postService.Update(post);
		
		if(bool)
		{
			//plus point for user
			User user=UserService.GetUserById(post.getAuthor().getId()+"");
			user.setPoint(user.getPoint()+POINT_PER_POST);
			UserService.UpdatePoint(user);
			
			//save history
			BrowsePost browsePost=new BrowsePost();
			User browserUserId=(User) httpSession.getAttribute("useractive");
			User browserUser=UserService.GetUserById(browserUserId.getId()+"");
			browsePost.setAuthor(browserUser);
			browsePost.setPost(post);
			long millis=System.currentTimeMillis();  
			Date date=new java.sql.Date(millis);  
			browsePost.setBrowsetime(date);
			
			browsePostService.SaveHistoryBrowsePost(browsePost);
			
			return "success";
		}
			
		
		return "fail";
	}
}
