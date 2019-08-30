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
	
	String namedoc;
	String typedoc;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "author")
	User author;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category")
	Category category;
	
	//int author;
	//int category;
	
	int dowloads;
	Boolean status;
	String about;
	String urldoc;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
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
	public String getNamedoc() {
		return namedoc;
	}
	public void setNamedoc(String namedoc) {
		this.namedoc = namedoc;
	}
	public String getTypedoc() {
		return typedoc;
	}
	public void setTypedoc(String typedoc) {
		this.typedoc = typedoc;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getUrldoc() {
		return urldoc;
	}
	public void setUrldoc(String urldoc) {
		this.urldoc = urldoc;
	}
	
//	public int getAuthor() {
//		return author;
//	}
//	public void setAuthor(int author) {
//		this.author = author;
//	}
//	public int getCategory() {
//		return category;
//	}
//	public void setCategory(int category) {
//		this.category = category;
//	}
	
	
}
