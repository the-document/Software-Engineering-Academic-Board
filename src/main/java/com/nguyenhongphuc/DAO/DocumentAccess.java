package com.nguyenhongphuc.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.IDocument;

@Repository
public class DocumentAccess implements IDocument{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Document> GetTest(String category) {
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
		
		String query="from document  " + 				
				"WHERE type  ='DETHI' and category= "+category;
		List<Document> list=(List<Document>)session.createQuery(query).getResultList();
		
		return list;
	}


	public List<Document> getDocumentsInSpecialType(String category, String type) {
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
		
		String query="from document  " + 				
				"WHERE type  ='"+type+"' and category= "+category;
		List<Document> list=(List<Document>)session.createQuery(query).getResultList();
	
		return list;
	}
}
