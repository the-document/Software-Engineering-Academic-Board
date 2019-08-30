package com.nguyenhongphuc.entity;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "post")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	String imageUrl;
	String title;
	String introcontent;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category")
	Category category;
	
	int viewcount;
	int upvote;
	String content;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "author")
	User author;
	
	Date postday;
	Boolean poststatus;
	String typePost;
	int readtime;
	
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getTypePost() {
		return typePost;
	}
	public void setTypePost(String typePost) {
		this.typePost = typePost;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

	public int getLike() {
		return upvote;
	}

	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getUpvote() {
		return upvote;
	}
	public void setUpvote(int upvote) {
		this.upvote = upvote;
	}
	public Boolean getPoststatus() {
		return poststatus;
	}
	public void setPoststatus(Boolean poststatus) {
		this.poststatus = poststatus;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	public Date getPostday() {
		return postday;
	}
	public void setPostday(Date postday) {
		this.postday = postday;
	}

	
	public String getIntrocontent() {
		return introcontent;
	}
	public void setIntrocontent(String introcontent) {
		this.introcontent = introcontent;
	}
	public int getReadtime() {
		return readtime;
	}
	public void setReadtime(int readtime) {
		this.readtime = readtime;
	}
	
	
}
