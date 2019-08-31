package com.nguyenhongphuc.DAO;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Upvote;
import com.nguyenhongphuc.interfaces.IUpvote;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UpvoteAccess implements IUpvote{

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public Boolean MakeUpvote(Upvote upvote) {
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session = sessionFactory.openSession();
		} finally {
			if (sessionFactory == null) {
				System.out.println("session fatory null");
			}

		}

		int key = (Integer) session.save(upvote);

		if (key == 0)
			return false;
		else {
			return true;
		}
	}

	@Transactional
	public Boolean CheckUpvoted(int postId, int userId) {
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session = sessionFactory.openSession();
		} finally {
			if (sessionFactory == null) {
				System.out.println("session fatory null");
			}

		}
		
		String query="from upvote where post= "+postId+" and voter ="+userId;
		Upvote vote = (Upvote) session.createQuery(query).getSingleResult();

		if (vote == null)
			return false;
		else {
			return true;
		}
	}
	
	
}
