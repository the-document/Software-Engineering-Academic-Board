package com.nguyenhongphuc.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "browsepost")
public class BrowsePost {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "browser")
	User browser;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "post")
	Post post;
	
	Date browsetime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	

	public User getBrowser() {
		return browser;
	}

	public void setBrowser(User browser) {
		this.browser = browser;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Date getBrowsetime() {
		return browsetime;
	}

	public void setBrowsetime(Date browsetime) {
		this.browsetime = browsetime;
	}
	
	
}
