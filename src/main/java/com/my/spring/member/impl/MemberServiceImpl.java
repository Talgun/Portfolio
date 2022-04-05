package com.my.spring.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.dao.MemberDAO;
import com.my.spring.dto.MemberVO;
import com.my.spring.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;
	
	@Override
	public MemberVO getMember(String id) {
		
		return mDao.getMember(id);
	}

	@Override
	public int confirmID(String id) {
	
		return mDao.confirmID(id);
	}

	@Override
	public void insertMember(MemberVO vo) {
	
		mDao.insertMember(vo);
	}

	@Override
	public int loginID(MemberVO vo) {
		
		return mDao.loginID(vo);
	}

	@Override
	public List<MemberVO> listMember(String name) {
		
		return mDao.listMember(name);
	}

}