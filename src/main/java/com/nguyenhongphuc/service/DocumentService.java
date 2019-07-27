package com.nguyenhongphuc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.DocumentAccess;
import com.nguyenhongphuc.entity.Document;
import com.nguyenhongphuc.interfaces.IDocument;

@Service
public class DocumentService implements IDocument{
	
	@Autowired
	DocumentAccess documentAccess;

	public List<Document> GetTest(String category){
		return documentAccess.GetTest(category);
	}

	public List<Document> getDocumentsInSpecialType(String category, String type) {
		return documentAccess.getDocumentsInSpecialType(category, type);
	}

	public Document GetDocumentsById(String idDoc) {
		return documentAccess.GetDocumentsById(idDoc);
	}

	public Boolean UploadDocument(Document document) {
		return documentAccess.UploadDocument(document);
	}

	public List<Document> getAllDocuments() {
		return documentAccess.getAllDocuments();
	}

	public List<Document> getAllDocumentsUnapproved() {
		return documentAccess.getAllDocumentsUnapproved();
	}

}
