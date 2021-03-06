package com.nguyenhongphuc.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.apache.taglibs.standard.tag.common.xml.IfTag;
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
import com.nguyenhongphuc.entity.Comment;
import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.Upvote;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.CatalogService;
import com.nguyenhongphuc.service.CommentService;
import com.nguyenhongphuc.service.PostService;
import com.nguyenhongphuc.service.UpvoteService;
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
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	UpvoteService upvoteService;

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
			sameContent=postService.GetPostByTypeWithAmount(4, post.getTypePost());
			for (Post p : sameContent) {
				p.setContent("");
			}
			
			
			List<Post> sameAuthor=new ArrayList<Post>();
			sameAuthor=postService.GetPostOfAuthor(post.getAuthor().getId());
			for (Post p : sameAuthor) {
				p.setContent("");
			}
			
			int idOfPost=Integer.parseInt(id);
			List<Comment> comments=new ArrayList<Comment>();
			comments=commentService.GetCommentOfPost(idOfPost);
			
			String voted = "yet";
			if (null != userActive) {
				if (upvoteService.CheckUpvoted(idOfPost, userActive.getId()))
					voted = "voted";
			}
			else {
				voted="nologin";
			}
			
			post.setViewcount(post.getViewcount()+1);
			postService.Update(post);
			
			
			modelMap.addAttribute("sameContent",sameContent);
			modelMap.addAttribute("sameAuthor",sameAuthor);
			modelMap.addAttribute("comments",comments);
			modelMap.addAttribute("voted",voted);
		} catch (Exception e) {
			System.out.println("ERR: "+e.getMessage());
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
					sameContent=postService.GetPostByTypeWithAmount(4, post.getTypePost());
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
			post.setImageUrl(image);
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
			post.setTypePost(type);
			
			Boolean result= postService.SavePost(post);
			if(result==false)
				return "Can't save, try again later";
			
			return "Success, the post will be broesed within 24h!";
		} catch (Exception e) {
			return "Can't save, try again later";
		}
	}
	
	@PostMapping("/comment")
	@ResponseBody
	public String PostComment(@RequestParam String parent,
			@RequestParam String content, HttpSession httpSession) {
		
		
		try {
			
			User user=(User) httpSession.getAttribute("useractive");
			if(user==null)
				return "errLogin";
				
			
			if(content.isEmpty())
				return "errContent";
			
			User realUser=userService.GetUserById(user.getId()+"");
			
			Comment comment =new Comment();
			long millis=System.currentTimeMillis();  
	        Date date=new java.sql.Date(millis);  
			comment.setParent(Integer.parseInt(parent));
			comment.setAuthor(realUser);
			comment.setCommentTime(date);
			comment.setContent(content);
			
			Boolean result= commentService.MakeComment(comment);
			if(result==false)
				return "ErrorSaveDB";
			
			return "Success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "ErrorSave";
			
		}
	}

	@PostMapping("/upvote")
	@ResponseBody
	public String UpvotePost(@RequestParam String parent,
			 HttpSession httpSession) {
		
		try {
			
			User user=(User) httpSession.getAttribute("useractive");
			if(user==null)
				return "errLogin";
			
			Upvote upvote=new Upvote();
			upvote.setPost(Integer.parseInt(parent));
			upvote.setVoter(user.getId());
			
			Boolean result= upvoteService.MakeUpvote(upvote);
			if(result==false)
				return "ErrorSaveDB";
			
			return "Success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "ErrorSave";
			
		}
	}
}
