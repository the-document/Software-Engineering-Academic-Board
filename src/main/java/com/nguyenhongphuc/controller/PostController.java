package com.nguyenhongphuc.controller;

import java.sql.Date;
import java.util.ArrayList;
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

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.CatalogService;
import com.nguyenhongphuc.service.PostService;
import com.nguyenhongphuc.service.UserService;

@Controller
@RequestMapping("/posts")
@SessionAttributes("useractive")
public class PostController {
	
	@Autowired
	PostService postService;

	@Autowired
	CatalogService catalogSevice;
	
	@Autowired
	UserService userService;

	@GetMapping
	public String Default(ModelMap modelMap) {

		List<Post> postShareList= postService.GetPostByTypeWithAmount(8, "share");
		List<Post> postTutorialList= postService.GetPostByTypeWithAmount(4, "tutorial");
		List<Post> postEventList= postService.GetPostByTypeWithAmount(4, "event");
		
		modelMap.addAttribute("postShareList", postShareList);
		modelMap.addAttribute("postTutorialList", postTutorialList);
		modelMap.addAttribute("postEventList", postEventList);
		
		return "post";
	}
	
	@GetMapping(path = "/detail/{id}")
	public String DetailPost(@PathVariable("id") String id, ModelMap modelMap,HttpSession session) {
		modelMap.clear();
		User userActive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", userActive);
		
		Post post =postService.GetPostById(id);
		modelMap.addAttribute("post", post);
		try {
			List<Post> sameContent=new ArrayList<Post>();
			sameContent=postService.GetPostByTypeWithAmount(4, post.getType());
			List<Post> sameAuthor=new ArrayList<Post>();
			sameAuthor=postService.GetPostOfAuthor(post.getAuthor().getId());
			
			post.setViewcount(post.getViewcount()+1);
			postService.Update(post);
			
			
			modelMap.addAttribute("sameContent",sameContent);
			modelMap.addAttribute("sameAuthor",sameAuthor);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return "postdetail";
	}
	
	@GetMapping(path = "/preview/detail/{id}")
	public String PreviewDetailPost(@PathVariable("id") String id, ModelMap modelMap,HttpSession session) {
		modelMap.clear();
		User userActive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", userActive);
		
		if(userActive!=null) {
			String position=userActive.getPosition();
			if(position.equals("admin")||position.equals("censor")) {
				Post post =postService.GetPostPreview(id);
				modelMap.addAttribute("post", post);
				try {
					List<Post> sameContent=new ArrayList<Post>();
					sameContent=postService.GetPostByTypeWithAmount(4, post.getType());
					List<Post> sameAuthor=new ArrayList<Post>();
					sameAuthor=postService.GetPostOfAuthor(post.getAuthor().getId());
					
					post.setViewcount(post.getViewcount()+1);
					postService.Update(post);
					
					
					modelMap.addAttribute("sameContent",sameContent);
					modelMap.addAttribute("sameAuthor",sameAuthor);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				return "postdetail";
			}
		}
		
		return "redirect:/";
	}

	@GetMapping("/upload")
	public String GetUploadView(ModelMap modelMap) {
		
		List<Category> categories=catalogSevice.getAllCatetory();
		modelMap.addAttribute("categories", categories);
		
		return "postUpload";
	}

	@PostMapping("/upload")
	@ResponseBody
	public String PostUpload(@RequestParam String title, @RequestParam String intro,
			@RequestParam String image, @RequestParam String cata,
			@RequestParam String type,@RequestParam String content, HttpSession httpSession) {
		
		try {
			
			User user=(User) httpSession.getAttribute("useractive");
			if(user==null)
				return "You have login to upload";			
			if(title.isEmpty())
				return "Title can't be empty";			
			if(intro.isEmpty())
				return "Intro can't be empty";						
			if(type.equals("-1"))
				return "Please choose a post type";		
			if(content.isEmpty())
				return "Content can't be empty";
			
			//ok can save===============================
			if(image.isEmpty())
				image="https://png.pngtree.com/png-vector/20190215/ourlarge/pngtree-satelliteantennaradarspacedish-line-icon-png-image_537586.jpg";
			
			Post post=new Post();
			post.setTitle(title);
			post.setIntrocontent(intro);
			post.setImage(image);
			try {
				Category category=catalogSevice.getCategory(Integer.parseInt(cata));
				post.setCategory(category);
			} catch (Exception e) {
				post.setCategory(null);
			}
					
			post.setViewcount(0);
			post.setUpvote(0);
			post.setContent(content);
			User realUser=userService.GetUserById(user.getId()+"");
			post.setAuthor(realUser);
			post.setReadtime(content.length()/900);
			
			long millis=System.currentTimeMillis();  
	        Date date=new java.sql.Date(millis);  
			post.setPostday(date);
			post.setPoststatus(false);
			post.setType(type);
			
			Boolean result= postService.SavePost(post);
			if(result==false)
				return "Can't save, try again later";
			
			return "Success, the post will be broesed within 24h!";
		} catch (Exception e) {
			return "Can't save, try again later";
		}
	}
}
