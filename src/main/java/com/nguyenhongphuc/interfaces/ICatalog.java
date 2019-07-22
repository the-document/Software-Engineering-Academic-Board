package com.nguyenhongphuc.interfaces;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nguyenhongphuc.entity.Category;

public interface ICatalog {
	
	public Category getCategory(int id);

	public List<Category> getDefaultCategory();

	public List<Category> getCategoryFor(String major);
}
