package com.nguyenhongphuc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.service.UserService;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;

@Controller
@RequestMapping("/login")
@SessionAttributes("useractive")
public class FacebookController {

	  public static String FACEBOOK_APP_ID = "889293998090512";
	  public static String FACEBOOK_APP_SECRET = "fde2e71e8791a839dd681d41650c4e35";
	  public static String FACEBOOK_REDIRECT_URL = "https://localhost:8443/Software-Engineering-Academic-Board/login/facebook";
	  public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
	  public static String FACEBOOK_LINK_GET_ID="https://graph.facebook.com/me?access_token=%s";
	  
	  @Autowired
	  UserService userSevirce;
	  
	public String getToken(final String code) throws ClientProtocolException, IOException {
		String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,
				FACEBOOK_REDIRECT_URL, code);
		System.out.println(link);
		System.out.println(code);
		String response = Request.Get(link).execute().returnContent().asString();	
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(response).get("access_token");
		return node.textValue();
	}
	
	//page login
	@GetMapping
	public String Default(ModelMap modelMap,HttpSession httpSession) {
		User user =(User) httpSession.getAttribute("user");
		modelMap.addAttribute("user", user);
		return "login";
	}
   
	
	@GetMapping("/facebook")
	public String ProcessInfor(HttpServletRequest request, ModelMap modelMap,HttpSession httpSession) throws ClientProtocolException, IOException {
		String code = request.getParameter("code");
		String accessToken = "";
		try {
			accessToken = this.getToken(code);
			System.out.println("token"+accessToken);	
			System.out.println("\n\n\n\n");
			
			String linkGetID=String.format(FACEBOOK_LINK_GET_ID, accessToken);
			
			
			String response = Request.Get(linkGetID).execute().returnContent().asString();
			ObjectMapper mapper = new ObjectMapper();
			JsonNode id = mapper.readTree(response).get("id");
			JsonNode name = mapper.readTree(response).get("name");
			
			String userID=id.asText();
			String userName=name.asText();
			  
			String userAvatar="https://graph.facebook.com/"+id.asText()+"/picture?type=large&width=720&height=720";

			User userInSystem=userSevirce.GetUserById(userID);
			if ( userInSystem!=null) {
				modelMap.addAttribute("useractive", userInSystem);
				httpSession.setAttribute("useractive", userInSystem);
				System.out.println("\nexist\n");
				System.out.println(userInSystem.getName());
			}
			else {
				User user = userSevirce.RegisterViaFacebook(userID,userName,userAvatar);
				if (user!=null) {
					modelMap.addAttribute("useractive", user);
					System.out.println("registered...");
					httpSession.setAttribute("useractive", user);
				} else {
					modelMap.addAttribute("useractive", user);
					System.out.println("can't register...");
					 return "redirect:/login";
				}

			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			 return "redirect:/";
		}
		
		//String referer = request.getHeader("Referer");
		//System.out.println("\n\n"+referer);
	    //return "redirect:"+ referer;
		return "redirect:/documents";
	}
	
//	@Transactional
//	private User GetUser(String id) {
//		
//		Session session;
//		try {
//			 session = sessionFactory.getCurrentSession();
//		} catch (Exception e) {
//			 session = sessionFactory.openSession();
//		}
//		
//		
//		List<User> users= (List<User>) session.createQuery("from user where username = '"+id+"'").getResultList();
//		
//		if(users.isEmpty())
//			return null;
//		
//		return users.get(0);
//	}
	
//	@Transactional
//	private User RegisterNewMember(String id,String name, String avatar) {
//		try {
//			User user=new User();
//			user.setUsername(id);
//			user.setName(name);
//			user.setPosition("Member");
//			user.setPoint(1000);
//			user.setAvatar(avatar);
//			
//			Session session;
//			try {
//				 session = sessionFactory.getCurrentSession();
//			} catch (Exception e) {
//				 session = sessionFactory.openSession();
//			}
//			
//			int key=(Integer) session.save(user);
//			
//			if(key!=0)
//			return user;
//			else {
//				return null;
//			}
//
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			return null;
//		}
//	}
}
