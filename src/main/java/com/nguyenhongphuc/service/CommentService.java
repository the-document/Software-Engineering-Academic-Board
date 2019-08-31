package com.nguyenhongphuc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.CommentAccess;
import com.nguyenhongphuc.entity.Comment;
import com.nguyenhongphuc.interfaces.IComment;

@Service
public class CommentService implements IComment{

	@Autowired 
	CommentAccess commentAccess;

	public Boolean MakeComment(Comment comment) {
		return commentAccess.MakeComment(comment);
	}

	public List<Comment> GetCommentOfPost(int postID) {
		return commentAccess.GetCommentOfPost(postID);
	}
	
	
}
