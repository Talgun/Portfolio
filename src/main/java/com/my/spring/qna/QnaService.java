package com.my.spring.qna;

import java.util.List;

import com.my.spring.dto.QnaVO;

public interface QnaService {

	List<QnaVO> listQna(String id);

	QnaVO getQna(int qseq);

	void insertQna(QnaVO vo);
	
	public List<QnaVO> listAllQna();
	
	public void updateQna(QnaVO vo);

}