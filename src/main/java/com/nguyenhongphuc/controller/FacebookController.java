package com.nguyenhongphuc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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



import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nguyenhongphuc.entity.User;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;

@Controller
@RequestMapping("/login")
public class FacebookController {

	  public static String FACEBOOK_APP_ID = "889293998090512";
	  public static String FACEBOOK_APP_SECRET = "fde2e71e8791a839dd681d41650c4e35";
	  public static String FACEBOOK_REDIRECT_URL = "https://localhost:8443/Software-Engineering-Academic-Board/login/process";
	  public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
	  
	  @Autowired
	  SessionFactory sessionFactory;
	  
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
	public String Default(ModelMap modelMap) {
		return "login";
	}
   
	
	@GetMapping("/process")
	public String ProcessInfor(HttpServletRequest request, ModelMap modelMap) throws ClientProtocolException, IOException {
		String code = request.getParameter("code");
		String accessToken = "";
		try {
			accessToken = this.getToken(code);
			System.out.println(accessToken);
			
			
			System.out.println("\n\n\n\n");
			
			FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FACEBOOK_APP_SECRET, Version.LATEST);
			com.restfb.types.User userfacebookUser=facebookClient.fetchObject("me", com.restfb.types.User.class);
			System.out.println("fb client:\n"+userfacebookUser);
			
			
			String idUser=userfacebookUser.getId();
			String nameString=userfacebookUser.getName();
			
			if (CheckingExistsInTheSystem(idUser) == true) {

				System.out.println("Wellcome" + nameString);
				modelMap.addAttribute("username", nameString);
				modelMap.addAttribute("success", "dang nhap thanh cong");
			}

			else {
				Boolean success = RegisterNewMember(userfacebookUser);
				if (success) {
					modelMap.addAttribute("success", "dang ky thanh cong");
					System.out.println("registered...");
				} else {
					modelMap.addAttribute("success", "dang ky that bai");
					System.out.println("can't register...");
				}

			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return "home";
	}
	
	@Transactional
	private Boolean CheckingExistsInTheSystem(String id) {
		
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		
		List<User> users= (List<User>) session.createQuery("from user where username = '"+id+"'").getResultList();
		
		if(users.isEmpty())
			return false;
		
		return true;
	}
	
	@Transactional
	private Boolean RegisterNewMember(com.restfb.types.User userFacebook) {
		try {
			User user=new User();
			user.setUsername(userFacebook.getId());
			user.setName(userFacebook.getName());
			user.setPosition("Member");
			user.setPoint(1000);
			user.setAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQU3Kz6dlgxTnxNJ-dNY1aGQ4hFaTfFFtc_a0hzdNa_c75t7dF");
			
			Session session;
			try {
				 session = sessionFactory.getCurrentSession();
			} catch (Exception e) {
				 session = sessionFactory.openSession();
			}
			
			int id=(Integer) session.save(user);
			
			if(id!=0)
			return true;
			else {
				return false;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}
