package com.nguyenhongphuc.interfaces;

import com.nguyenhongphuc.entity.Upvote;


public interface IUpvote {
	Boolean MakeUpvote(Upvote upvote);
	Boolean CheckUpvoted(int postId,int userId);
}
