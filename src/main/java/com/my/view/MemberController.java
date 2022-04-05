package com.my.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.my.spring.dto.MemberVO;
import com.my.spring.member.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	/*
	 * 로그인 화면 표시
	 */
	@GetMapping(value="/login_form")
	public String loginView() {
		
		return "member/login";
	}
	
	/*
	 *  사용자 로그인 처리
	 *  
	 *  vo 객체에서 id, pwd 정보를 읽어와 사용자 인증
	 */
	@PostMapping(value="/login")
	public String loginAction(MemberVO vo, Model model) {
		MemberVO loginUser = null;
		
		int result = memberService.loginID(vo);
		
		if (result == 1) { // 사용자 인증 성공
			// 사용자 정보를 조회하여 Session 객체에 저장
			loginUser = memberService.getMember(vo.getId());
			// @SessionAttribute로 지정하여 세션에도 저장됨
			model.addAttribute("loginUser", loginUser);  
			
			return "redirect:/index";
		} else { // 사용자 인증 실패
			return "member/login_fail";
		}
	}
	
	@GetMapping(value="/logout")
	public String logout(SessionStatus status) {
		
		// session.invalidate();   동작이 안됨
		status.setComplete();  // 현재 세션을 종료
		
		return "index";
	}
	
	@GetMapping(value="/contract")
	public String contractView() {
		
		return "member/contract";
	}
	
	@PostMapping(value="/join_form")
	public String joinView() {
		
		return "member/join";
	}
	
	/*
	 *  ID중복 체크 화면 출력
	 */
	@GetMapping(value="/id_check_form")
	public String idCheckView(MemberVO vo, Model model) {
		
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
	}
	
	/*
	 * ID중복 체크 수행
	 */
	@PostMapping(value="/id_check_form")
	public String idCheckAction(MemberVO vo, Model model) {
		
		int result = memberService.confirmID(vo.getId());
		
		model.addAttribute("message", result);
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
	}
	
	/*
	 *  사용할 id를 join(회원 가입)화면에 전송
	 */
	@GetMapping(value="/id_check_confirmed")
	public String idCheckConfirmed(MemberVO vo, Model model) {
		
		model.addAttribute("id", vo.getId());
		model.addAttribute("reid", vo.getId());     // id 중복확인 필드
		
		return "member/join";
	}
	
	/*
	 *  회원가입 처리
	 */
	@PostMapping(value="/join")
	public String joinAction(@RequestParam(value="address1")String address1,
			                 @RequestParam(value="address2")String address2,
			                 @RequestParam(value="address3")String address3,
									MemberVO vo) {
		vo.setAddress1(address1);
		vo.setAddress2(address2);
		vo.setAddress3(address3);
		memberService.insertMember(vo);
		
		return "member/login";
	}
	

}
