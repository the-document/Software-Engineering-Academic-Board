package com.nguyenhongphuc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "upvote")
public class Upvote {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	int post;
	int voter;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public int getVoter() {
		return voter;
	}
	public void setVoter(int voter) {
		this.voter = voter;
	}
	
	
}
