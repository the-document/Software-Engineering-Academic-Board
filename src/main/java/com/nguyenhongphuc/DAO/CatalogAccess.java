package com.nguyenhongphuc.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.ICatalog;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CatalogAccess implements ICatalog{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<Category> getDefaultCategory() {
		
		Session session;
		try {
			session=sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session=sessionFactory.openSession();
		}
		finally {
			if (sessionFactory==null) {
				System.out.println("session fatory null");
			}
			
		}
		
		
		String query = "FROM category WHERE scope = 'Đại cương'";
		List<Category> lists= (List<Category>)session.createQuery(query).getResultList();
		//System.out.println("size list:\n"+lists.size());
		return lists;
	}

	public List<Category> getCategoryFor(String major) {
		Session session;
		try {
			session=sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session=sessionFactory.openSession();
		}
		finally {
			if (sessionFactory==null) {
				System.out.println("session fatory null");
			}
			
		}
		
		
		String query = "FROM category WHERE scope = '"+ major+"'";
		List<Category> lists= (List<Category>)session.createQuery(query).getResultList();
		//System.out.println("size list:\n"+lists.size());
		return lists;
	}

	public Category getCategory(int id) {
		Session session;
		try {
			session=sessionFactory.getCurrentSession();
		} catch (Exception e) {
			session=sessionFactory.openSession();
		}
		finally {
			if (sessionFactory==null) {
				System.out.println("session fatory null");
			}
			
		}
		
		
		String query = "FROM category WHERE id = '"+ id+"'";
		Category category= (Category)session.createQuery(query).getSingleResult();
		//System.out.println("size list:\n"+lists.size());
		return category;
	}

	public List<Category> getAllCatetory() {
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

		String query = "from category  ";
		List<Category> categorys = null;
		categorys = (List<Category>) session.createQuery(query).getResultList();

		return categorys;
	}


}
