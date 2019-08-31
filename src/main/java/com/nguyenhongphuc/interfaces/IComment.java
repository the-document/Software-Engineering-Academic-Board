package com.nguyenhongphuc.interfaces;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nguyenhongphuc.entity.Comment;


public interface IComment {
	Boolean MakeComment(Comment comment);
	List<Comment> GetCommentOfPost(int postID);
}
