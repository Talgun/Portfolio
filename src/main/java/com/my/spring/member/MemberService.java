package com.my.spring.member;

import java.util.List;

import com.my.spring.dto.MemberVO;

public interface MemberService {

	// 회원 상세정보 조회
	MemberVO getMember(String id);

	// 회원 존재여부확인
	/*
	 * 리턴값:
	 *      회원이 존재하면: 1
	 *      회원이 존재하지 않으면: -1
	 */
	int confirmID(String id);

	// 사용자 인증
	public int loginID(MemberVO vo);
	
	// 회원 등록
	void insertMember(MemberVO vo);
	
	// 회원 목록 조회
	public List<MemberVO> listMember(String name);
}