package com.nguyenhongphuc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.BrowDocumentAccess;
import com.nguyenhongphuc.entity.Browsedocuments;
import com.nguyenhongphuc.interfaces.IBrowseDocument;

@Service
public class BrowseDocumentService  implements IBrowseDocument{

	@Autowired
	BrowDocumentAccess browDocumentAccess;
	
	public Boolean SaveHistoryDocument(Browsedocuments browsedocuments) {
		return browDocumentAccess.SaveHistoryDocument(browsedocuments);
	}

}
