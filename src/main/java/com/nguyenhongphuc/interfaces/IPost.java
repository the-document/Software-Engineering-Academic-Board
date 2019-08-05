package com.nguyenhongphuc.interfaces;

import java.util.List;

import com.nguyenhongphuc.entity.Post;

public interface IPost {
	
	public List<Post> Get5LatestShare();
	public List<Post> GetLatestEvents();
	public List<Post> Get4LatestTutorial();
	public Post GetPostById(String id);
	public List<Post> GetPostByTypeWithAmount(int count,String type);
	public List<Post> GetPostOfAuthor(int idAuthor);
	public List<Post> GetTopPost(int count);
	public Boolean Update(Post post);
	public List<Post> GetPostsUnActive();
	public Post GetPostPreview(String id);
	public Boolean SavePost(Post post);
}
