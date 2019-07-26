package com.nguyenhongphuc.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.interfaces.IUser;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserAccess implements IUser{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public User GetUserById(String id) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		List<User> users= (List<User>) session.createQuery("from user where username = '"+id+"'").getResultList();
		
		if(users.isEmpty())
			return null;
		
		return users.get(0);
	}

	@Transactional
	public User GetUserByUsername(String username) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		List<User> users= (List<User>) session.createQuery("from user where username = '"+username+"'").getResultList();
		
		if(users.isEmpty())
			return null;
		
		return users.get(0);
	}

	@Transactional
	public Boolean SaveUser(User user) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		System.out.println("prepare save");
		int key= (Integer) session.save(user);
		System.out.println("saved");
		if(key!=0)
			return true;
			else {
				System.out.println("can't save");
				return false;
			}
	}

	@Transactional
	public User RegisterViaFacebook(String id, String name, String avatar) {
		try {
			User user=new User();
			user.setUsername(id);
			user.setName(name);
			user.setPosition("Member");
			user.setPoint(1000);
			user.setAvatar(avatar);
			
			Session session;
			try {
				 session = sessionFactory.getCurrentSession();
			} catch (Exception e) {
				 session = sessionFactory.openSession();
			}
			
			int key=(Integer) session.save(user);
			
			if(key!=0)
			return user;
			else {
				return null;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public Boolean UpdatePoint(User user) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		

			System.out.println("prepare update");
			System.out.println(user.getPoint()+"--");
//			String query = "UPDATE user " + 
//					"SET password = "+user.getPassword()
//					+" ,name = "+user.getName()+" ,major = "+user.getMajor()+", position = "+user.getPosition()
//					+", point = "+user.getPoint()+" ,description = "+user.getDescription()
//					+", avatar = "+user.getAvatar()+" ,token ="+user.getToken()+ " WHERE id="+user.getId();
			
			String query = "UPDATE user SET point = " +user.getPoint()+ " WHERE id="+user.getId();
			int i= session.createQuery(query).executeUpdate();
			
			if(i!=0) {
				System.out.println("updated"+user.getId());
				return true;
			}
			System.out.println("can't update"+user.getId());
			return false;
		}
		
}
