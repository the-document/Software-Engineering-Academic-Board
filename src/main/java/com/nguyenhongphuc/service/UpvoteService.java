package com.nguyenhongphuc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.UpvoteAccess;
import com.nguyenhongphuc.entity.Upvote;
import com.nguyenhongphuc.interfaces.IUpvote;

@Service
public class UpvoteService implements IUpvote{

	@Autowired
	UpvoteAccess upvoteAccess;

	public Boolean MakeUpvote(Upvote upvote) {
		return upvoteAccess.MakeUpvote(upvote);
	}

	public Boolean CheckUpvoted(int postId, int userId) {
		return upvoteAccess.CheckUpvoted(postId, userId);
	}
	
}
