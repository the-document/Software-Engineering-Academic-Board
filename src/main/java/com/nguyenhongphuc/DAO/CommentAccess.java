package com.nguyenhongphuc.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Comment;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.IComment;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CommentAccess implements IComment{
	
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public Boolean MakeComment(Comment comment) {
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

		int key = (Integer) session.save(comment);

		if (key == 0)
			return false;
		else {
			return true;
		}
	}

	@Transactional
	public List<Comment> GetCommentOfPost(int postID) {
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

		String query = "from comment WHERE parent  = " + postID;
		// String query="from document d ,user a WHERE d.author=a.id and type ='DETHI'
		// and category="+category;
		List<Comment> list = (List<Comment>) session.createQuery(query).getResultList();

		return list;
	}
	
	
}
