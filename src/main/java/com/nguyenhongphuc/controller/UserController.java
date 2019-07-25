package com.nguyenhongphuc.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@PostMapping("/register")
	@ResponseBody
	public User Register(@RequestParam String username,
			@RequestParam String name,
			@RequestParam String password,
			@RequestParam String password2) {
		
		User user =new User();
		if(!password.equals(password2)) {
			user.setName("Mật khẩu không khớp!");
			return user; //id= 0 mean err
		}
		
		User userCheckExist=userService.GetUserByUsername(username);
		if(userCheckExist!=null) {
			user.setName("Tên đăng nhập đã tồn tại!");
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
		user.setName(name);
		user.setPassword(savePass);
		user.setAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ohqZNJMaI4irCuvXh2wUHJuj_Yup6uaRM21bjwQ1tJ9er0k5");
		user.setPoint(1000);
		user.setPosition("Member");
		
		Boolean result=userService.SaveUser(user);
		if(result==false) {
			user.setName("Lỗi đăng ký, thử lại sau!");
			return user; //id= 0 mean err
		}
		
		return user;
		//return null;
	}
	
	@GetMapping("/register")
	public String GetFormRegister() {
		return "testPost";
	}
}
