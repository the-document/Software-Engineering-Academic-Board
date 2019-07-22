package com.nguyenhongphuc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "document")
public class Document {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	String name;
	String type;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	User author;
//	
//	@OneToOne
//	Category category;
	
	//int author;
	int category;
	
	int dowloads;
	Boolean status;
	String description;
	String url;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
//	public Category getCategory() {
//		return category;
//	}
//	public void setCategory(Category category) {
//		this.category = category;
//	}
	public int getDowloads() {
		return dowloads;
	}
	public void setDowloads(int dowloads) {
		this.dowloads = dowloads;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
//	public int getAuthor() {
//		return author;
//	}
//	public void setAuthor(int author) {
//		this.author = author;
//	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	
}
