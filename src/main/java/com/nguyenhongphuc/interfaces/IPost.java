package com.nguyenhongphuc.interfaces;

import java.util.List;

import com.nguyenhongphuc.entity.Post;

public interface IPost {
	
	public List<Post> Get5LatestShare();
	public List<Post> GetLatestEvents();
	public List<Post> Get4LatestTutorial();
}
