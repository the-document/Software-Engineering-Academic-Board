package com.nguyenhongphuc.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.BrowsePost;
import com.nguyenhongphuc.interfaces.IBrowsePost;

@Repository
public class BrowsePostAccess implements IBrowsePost{

	@Autowired
	SessionFactory sessionFactory;
	
	public Boolean SaveHistoryBrowsePost(BrowsePost browsePost) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		

		int key= (Integer) session.save(browsePost);
		System.out.println("saved");
		if(key!=0)
			return true;
			else {
				System.out.println("can't save");
				return false;
			}
	}

	

}
