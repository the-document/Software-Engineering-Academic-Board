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

	public Post GetPostById(String id) {
		return postAccess.GetPostById(id);
	}

	public List<Post> GetPostByTypeWithAmount(int count, String type) {
		return postAccess.GetPostByTypeWithAmount(count, type);
	}

	public List<Post> GetPostOfAuthor(int idAuthor) {
		return postAccess.GetPostOfAuthor(idAuthor);
	}

	public List<Post> GetTopPost(int count) {
		return postAccess.GetTopPost(count);
	}

	public Boolean Update(Post post) {
		return postAccess.Update(post);
	}

	public List<Post> GetPostsUnActive() {
		return postAccess.GetPostsUnActive();
	}

	public Post GetPostPreview(String id) {
		return postAccess.GetPostPreview(id);
	}
	
	
}
