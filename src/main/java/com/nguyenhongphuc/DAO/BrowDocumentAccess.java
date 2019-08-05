package com.nguyenhongphuc.DAO;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.BrowsePost;
import com.nguyenhongphuc.entity.Browsedocuments;
import com.nguyenhongphuc.interfaces.IBrowseDocument;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BrowDocumentAccess implements IBrowseDocument{
	
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public Boolean SaveHistoryDocument(Browsedocuments browsedocuments) {
		Session session;
		try {
			 session = sessionFactory.getCurrentSession();
		} catch (Exception e) {
			 session = sessionFactory.openSession();
		}
		

		int key= (Integer) session.save(browsedocuments);
		System.out.println("saved");
		if(key!=0)
			return true;
			else {
				System.out.println("can't save");
				return false;
			}
	}

	
}
