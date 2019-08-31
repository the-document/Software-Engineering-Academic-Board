package com.nguyenhongphuc.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.PostService;
import com.nguyenhongphuc.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("useractive")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PostService postService;
	
	@PostMapping("/register")
	@ResponseBody
	public User Register(@RequestParam String username,
			@RequestParam String name,
			@RequestParam String password,
			@RequestParam String password2) {
		
		User user =new User();
		
		//check empty
		if(username.isEmpty()||name.isEmpty()||password.isEmpty()||password2.isEmpty()) {
			user.setFullname("Bạn phải điền tất cả các trường!");
			return user; //id= 0 mean err
		}
		
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	    if(!username.matches(regex))
	    {
	    	user.setFullname("Định dạng email không đúng!");
			return user; //id= 0 mean err
	    }
	    
		if(!password.equals(password2)) {
			user.setFullname("Mật khẩu không khớp!");
			return user; //id= 0 mean err
		}
		
		User userCheckExist=userService.GetUserByUsername(username);
		if(userCheckExist!=null) {
			user.setFullname("Tên đăng nhập đã tồn tại!");
			return user; //id= 0 mean err
		}
		
		//ma hoa passworld
		String savePass = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(password.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			savePass = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		user.setUsername(username);
		user.setFullname(name);
		user.setPass(savePass);
		user.setAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ohqZNJMaI4irCuvXh2wUHJuj_Yup6uaRM21bjwQ1tJ9er0k5");
		user.setPoint(1000);
		user.setPosition("Member");
		
		Boolean result=userService.SaveUser(user);
		if(result==false) {
			user.setFullname("Lỗi đăng ký, thử lại sau!");
			return user; //id= 0 mean err
		}
		
		user.setPass("********************");
		return user;
		//return null;
	}
	
	@GetMapping("/register")
	public String GetFormRegister() {
		return "testPost";
	}

	@GetMapping("/login")
	public String GetViewLogin()
	{
		return "login";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public User login(@RequestParam String username,@RequestParam String password,HttpSession httpSession) {
		User user =new User();
		
		User userCheck=userService.GetUserByUsername(username);
		if(userCheck==null) {
			user.setFullname("Tài khoản không tồn tại");
			return user;
		}

		// ma hoa passworld
		String savePass = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(password.getBytes());
			BigInteger bigInteger = new BigInteger(1, digest.digest());
			savePass = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
			
		if(!savePass.equals(userCheck.getPass())) {
			user.setFullname("Mật khẩu không đúng");
			return user;
		}
		
	
		userCheck.setPass("********************");
		httpSession.setAttribute("useractive", userCheck);
		httpSession.setMaxInactiveInterval(300);
		return userCheck;
	}

	@GetMapping("/logout")
	public String LogOut(HttpServletRequest request,ModelMap modelMap) {
		try {
			modelMap.clear();
			request.getSession().setAttribute("useractive",null);
			request.getSession().removeAttribute("useractive");
			System.out.println("logouted");
			request.getSession().invalidate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		 
		String referer = request.getHeader("Referer");
		System.out.println("\n\n222"+referer);
	    return "redirect:"+ referer;
	}

	//===VIEW CONTROLL==================
	@GetMapping(path = "/{id}")
	public String GetProfileUserPAge(@PathVariable("id") String id,ModelMap modelMap, HttpSession session) {
		modelMap.clear();
		User userActive=(User) session.getAttribute("useractive");
		modelMap.addAttribute("useractive", userActive);
		
		User user=userService.GetUserById(id);
		if(user==null) {
			return "redirect:/";
		}
		
		List<Post> posts=postService.GetPostOfAuthor(user.getId());
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("posts", posts);
		
		
		return "user";
	}
	
}
