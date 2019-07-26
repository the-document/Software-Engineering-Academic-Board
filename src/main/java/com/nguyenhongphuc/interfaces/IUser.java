package com.nguyenhongphuc.interfaces;

import com.nguyenhongphuc.entity.User;

public interface IUser {

	User GetUserById(String id);
	User GetUserByUsername(String username);
	Boolean SaveUser(User user);
	User RegisterViaFacebook(String id,String name, String avatar);
	
	Boolean UpdatePoint(User user);

}
