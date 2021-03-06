package com.nguyenhongphuc.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "browsedocuments")
public class Browsedocuments {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "author")
	User author;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "document")
	Document document;
	
	Date browsetime;
	
	
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
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
	public Date getBrowsetime() {
		return browsetime;
	}
	public void setBrowsetime(Date browsetime) {
		this.browsetime = browsetime;
	}
	
}
