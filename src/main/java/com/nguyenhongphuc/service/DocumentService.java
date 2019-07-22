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

}
