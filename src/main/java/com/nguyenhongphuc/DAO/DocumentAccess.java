package com.nguyenhongphuc.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.IDocument;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DocumentAccess implements IDocument {

	@Autowired
	SessionFactory sessionFactory;

	//Document da duoc duyet
	@Transactional
	public List<Document> GetTest(String category) {
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

		String query = "from document  " + "WHERE type  ='DETHI' and category= " + category+" and status = 1";
		// String query="from document d ,user a WHERE d.author=a.id and type ='DETHI'
		// and category="+category;
		List<Document> list = (List<Document>) session.createQuery(query).getResultList();

		return list;
	}

	@Transactional
	public List<Document> getDocumentsInSpecialType(String category, String type) {
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

		String query = "from document  " + "WHERE type  ='" + type + "' and category= " + category+" and status = 1";
		List<Document> list = (List<Document>) session.createQuery(query).getResultList();

		return list;
	}

	//document khac- same name
	@Transactional
	public Document GetDocumentsById(String idDoc) {
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

		String query = "from document  " + "WHERE id = " + idDoc;
		Document doc = null;
		doc = (Document) session.createQuery(query).getSingleResult();

		return doc;
	}

	@Transactional
	public Boolean UploadDocument(Document document) {
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

		int key = (Integer) session.save(document);

		if (key == 0)
			return false;
		else {
			return true;
		}
	}

	@Transactional
	public List<Document> getAllDocuments() {
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

		String query = "from document  ";
		List<Document> docs = null;
		docs = (List<Document>) session.createQuery(query).getResultList();

		return docs;
	}

	@Transactional
	public List<Document> getAllDocumentsUnapproved(){
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

		String query = "from document  " + "WHERE status = 0";
		// String query="from document d ,user a WHERE d.author=a.id and type ='DETHI'
		// and category="+category;
		List<Document> list = (List<Document>) session.createQuery(query).getResultList();

		return list;
	}

	@Transactional
	public Boolean UpdateDocument(Document document) {
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

		String query = "update document  set dowloads = "+ (Integer)( document.getDowloads()+1) 
				+" , status = "+ document.getStatus()
				+" , name = '"+ document.getName()
				+"' , url = '"+ document.getUrl()
				+ "' WHERE id = " +document.getId();
		
		int i= session.createQuery(query).executeUpdate();
		if(i!=0)
			return true;
		return false;
	}
}
