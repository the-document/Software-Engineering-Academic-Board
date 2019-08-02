package com.nguyenhongphuc.controller;

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
		//return home posts.
		
		return "post";
	}
	
	@GetMapping(path = "/detail/{id}")
	public String DetailPost(@PathVariable("id") String id, ModelMap modelMap,HttpSession session) {
		modelMap.clear();
		User userActive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", userActive);
		
		Post post =postService.GetPostById(id);
		List<Post> sameContent=postService.GetPostByTypeWithAmount(4, post.getType());
		List<Post> sameAuthor=postService.GetPostOfAuthor(post.getAuthor().getId());
		
		post.setViews(post.getViews()+1);
		postService.Update(post);
		
		modelMap.addAttribute("post", post);
		modelMap.addAttribute("sameContent",sameContent);
		modelMap.addAttribute("sameAuthor",sameAuthor);
		
		
		
		return "postdetail";
	}

}
