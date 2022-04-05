package com.my.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.my.spring.dto.MemberVO;
import com.my.spring.dto.QnaVO;
import com.my.spring.qna.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	/*
	 *  회원id를 조건으로 모든 qna 조회
	 */
	@GetMapping(value="qna_list")
	public String qnaList(HttpSession session, Model model) {
		
	
		// 회원 로그인 확인
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			List<QnaVO> qnaList = qnaService.listQna(loginUser.getId());
			
			model.addAttribute("qnaList", qnaList);
			
			return "qna/qnaList";
		}
	}
	
	@GetMapping(value="/qna_write_form")
	public String qnaWriteView(HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			return "qna/qnaWrite";
		}
	}
	
	@PostMapping(value="/qna_write")
	public String qnaWriteAction(QnaVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
				
		if(loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			qnaService.insertQna(vo);
			
			return "redirect:qna_list";
		}
	}
	
	@GetMapping(value="/qna_view")
	public String qnaView(QnaVO vo, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			
			QnaVO qna = qnaService.getQna(vo.getQseq());
			model.addAttribute("qnaVO", qna);
			
			return "qna/qnaView";
		}
	}
}