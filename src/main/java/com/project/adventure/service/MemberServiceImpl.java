package com.project.adventure.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int midConfirm(String mid) {
		return memberDao.midConfirm(mid);		
	}

	@Override
	public int memailConfirm(String memail) {
		return memberDao.memailConfirm(memail);		
	}

}
