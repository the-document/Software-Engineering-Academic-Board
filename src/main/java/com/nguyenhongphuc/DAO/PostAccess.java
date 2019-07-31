package com.nguyenhongphuc.DAO;

import java.util.List;

import javax.sound.midi.Soundbank;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.entity.User;
import com.nguyenhongphuc.interfaces.IPost;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PostAccess implements IPost{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<Post> Get5LatestShare() {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE status=1 and type = 'SHARE' ORDER BY views DESC";
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).setMaxResults(5).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		

		
		return posts;
	}

	@Transactional
	public List<Post> GetLatestEvents() {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE status=1 and type = 'EVENT'  ORDER BY  postday DESC";
		
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).setMaxResults(1).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return posts;
	}

	@Transactional
	public List<Post> Get4LatestTutorial() {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE status=1 and type = 'TUTORIAL'  ORDER BY views DESC	";
		
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).setMaxResults(4).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return posts;
	}

	
	@Transactional
	public Post GetPostById(String id) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE status=1 and id= "+id;
		Post post=null;
		try {
			post= (Post) session.createQuery(query).getSingleResult();
		} catch (Exception e) {
			System.out.println("No post found."+ e.getMessage());
		}
		
		
		return post;
	}
	
	

}
