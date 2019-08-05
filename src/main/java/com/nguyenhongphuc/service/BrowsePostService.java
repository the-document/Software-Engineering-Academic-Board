package com.nguyenhongphuc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenhongphuc.DAO.BrowsePostAccess;
import com.nguyenhongphuc.entity.BrowsePost;
import com.nguyenhongphuc.interfaces.IBrowsePost;

@Service
public class BrowsePostService implements IBrowsePost{

	@Autowired
	BrowsePostAccess browsePostAccess;
	
	public Boolean SaveHistoryBrowsePost(BrowsePost browsePost) {
		return browsePostAccess.SaveHistoryBrowsePost(browsePost);
	}

}
