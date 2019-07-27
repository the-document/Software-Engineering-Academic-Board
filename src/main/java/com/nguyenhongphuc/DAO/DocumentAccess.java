package com.nguyenhongphuc.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.IDocument;

@Repository
public class DocumentAccess implements IDocument {

	@Autowired
	SessionFactory sessionFactory;

	//Document da duoc duyet
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
}
