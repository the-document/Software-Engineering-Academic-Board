package com.nguyenhongphuc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.UserAccess;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.interfaces.IUser;

@Service
public class UserService implements IUser{

	@Autowired
	UserAccess userAccess;
	
	public User GetUserById(String id) {
		return userAccess.GetUserById(id);
	}


	public User GetUserByUsername(String username) {
		return userAccess.GetUserByUsername(username);
	}

	public Boolean SaveUser(User user) {
		return userAccess.SaveUser(user);
	}
	
	public User RegisterViaFacebook(String id, String name, String avatar) {
		return userAccess.RegisterViaFacebook(id, name, avatar);
	}
	

}
