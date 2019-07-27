package com.nguyenhongphuc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.PostAccess;
import com.nguyenhongphuc.entity.Post;
import com.nguyenhongphuc.interfaces.IPost;

@Service
public class PostService implements IPost{

	@Autowired 
	PostAccess postAccess;

	public List<Post> Get5LatestShare() {
		return postAccess.Get5LatestShare();
	}

	public List<Post> GetLatestEvents() {
		return postAccess.GetLatestEvents();
	}

	public List<Post> Get4LatestTutorial() {
		return postAccess.Get4LatestTutorial();
	}
	
	
}
