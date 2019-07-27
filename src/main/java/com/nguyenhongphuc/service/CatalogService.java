package com.nguyenhongphuc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.CatalogAccess;
import com.nguyenhongphuc.entity.Category;
import com.nguyenhongphuc.interfaces.ICatalog;

@Service
public class CatalogService implements ICatalog{

	@Autowired
	CatalogAccess catalogAccess;
	
	public List<Category> getDefaultCategory() {
		return catalogAccess.getDefaultCategory();
	}

	public List<Category> getCategoryFor(String major) {
		return catalogAccess.getCategoryFor(major);
	}

	public Category getCategory(int id) {
		return catalogAccess.getCategory(id);
	}

	public List<Category> getAllCatetory() {
		return catalogAccess.getAllCatetory();
	}

	

}
