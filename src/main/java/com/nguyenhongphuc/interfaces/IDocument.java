package com.nguyenhongphuc.interfaces;

import java.util.List;

import com.nguyenhongphuc.entity.Document;

public interface IDocument {

	public List<Document> GetTest(String category);
	public List<Document>getDocumentsInSpecialType(String category,String type);
}
