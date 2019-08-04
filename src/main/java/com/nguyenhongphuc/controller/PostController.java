package com.nguyenhongphuc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.PostService;

@Controller
@RequestMapping("/posts")
@SessionAttributes("useractive")
public class PostController {
	
	@Autowired
	PostService postService;

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
			
			post.setViews(post.getViews()+1);
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
					
					post.setViews(post.getViews()+1);
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

}
