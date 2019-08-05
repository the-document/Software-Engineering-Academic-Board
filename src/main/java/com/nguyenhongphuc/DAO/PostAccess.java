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

import net.bytebuddy.asm.Advice.Return;

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
		
		
		String query="FROM post WHERE status=1 and type = 'SHARE' ORDER BY viewcount DESC";
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
		
		
		String query="FROM post WHERE status=1 and type = 'TUTORIAL'  ORDER BY viewcount DESC	";
		
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
		
		
		String query="FROM post WHERE poststatus=1 and id= "+id;
		Post post=null;
		try {
			post= (Post) session.createQuery(query).getSingleResult();
		} catch (Exception e) {
			System.out.println("No post found."+ e.getMessage());
		}
		
		
		return post;
	}

	
	@Transactional
	public List<Post> GetPostByTypeWithAmount(int count, String type) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE poststatus=1 and type = '"+type+"'  ORDER BY postday DESC	";
		
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).setMaxResults(count).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return posts;
	}

	@Transactional
	public List<Post> GetPostOfAuthor(int idAuthor) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE poststatus=1 and author= "+idAuthor+" ORDER BY viewcount DESC";
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
	public List<Post> GetTopPost(int count) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE poststatus=1  ORDER BY viewcount DESC";
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).setMaxResults(count).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		return posts;
	}

	
	@Transactional
	public Boolean Update(Post post) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="UPDATE post SET viewcount = "+post.getViewcount()+", poststatus ="+ post.getPoststatus() +" WHERE id = "+ post.getId();
		int i= session.createQuery(query).executeUpdate();
		
		if(i!=0) {
			
			return true;
		}
		
		return false;
	}

	@Transactional
	public List<Post> GetPostsUnActive() {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE poststatus=0";
		List<Post> posts=null;
		try {
			posts= (List<Post>) session.createQuery(query).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		return posts;
	}

	@Transactional
	public Post GetPostPreview(String id) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		
		
		String query="FROM post WHERE id= "+id;
		Post post=null;
		try {
			post= (Post) session.createQuery(query).getSingleResult();
		} catch (Exception e) {
			System.out.println("No post found."+ e.getMessage());
		}
		
		
		return post;
	}

	@Transactional
	public Boolean SavePost(Post post) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		

		int key= (Integer) session.save(post);
		System.out.println("saved");
		if(key!=0)
			return true;
			else {
				System.out.println("can't save");
				return false;
			}
		
	}
		
}
