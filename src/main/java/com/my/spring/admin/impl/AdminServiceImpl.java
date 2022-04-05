package com.my.spring.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.admin.AdminService;
import com.my.spring.dao.AdminDAO;
import com.my.spring.dto.WorkerVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;
	/*
	 *  입력 파라미터: 
	 *  	id - 관리자 id
	 *  출력 :
	 *  	-1: id가 존재하지 않음
	 *  	 0: 비밀번호 맞지 않음
	 *  	 1: 정상 로그인
	 */
	@Override
	public int workerCheck(WorkerVO vo) {
		int result = -1;
		
		// worker 테이블에서 id를 조건으로 pwd를 조회
		String pwd_in_db = adminDao.workerCheck(vo.getId());
		
		// 사용자 입력 pwd와 테이블에서 조회한 pwd를 비교
		if (pwd_in_db == null) {
			result = -1;
		} else if (vo.getPwd().equals(pwd_in_db)) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}

	@Override
	public WorkerVO getEmployee(String id) {
		
		return adminDao.getEmployee(id);
	}

}
