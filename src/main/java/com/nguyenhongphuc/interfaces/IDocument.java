package com.nguyenhongphuc.interfaces;

import java.util.List;

import com.nguyenhongphuc.entity.Document;

public interface IDocument {

	public List<Document> GetTest(String category);
	public List<Document>getDocumentsInSpecialType(String category,String type);
	public Document GetDocumentsById(String idDoc);
	public List<Document>getAllDocuments();
	public Boolean UploadDocument(Document document);
	public List<Document> getAllDocumentsUnapproved();
}
