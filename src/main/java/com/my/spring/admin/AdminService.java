package com.my.spring.admin;

import com.my.spring.dto.WorkerVO;

public interface AdminService {

	int workerCheck(WorkerVO vo);

	WorkerVO getEmployee(String id);

}