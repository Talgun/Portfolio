package com.my.view;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.MillisecondInstantPrinter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.my.spring.admin.AdminService;
import com.my.spring.dto.MemberVO;
import com.my.spring.dto.OrderVO;
import com.my.spring.dto.ProductVO;
import com.my.spring.dto.QnaVO;
import com.my.spring.dto.SalesQuantity;
import com.my.spring.dto.WorkerVO;
import com.my.spring.member.MemberService;
import com.my.spring.order.OrderService;
import com.my.spring.product.ProductService;
import com.my.spring.qna.QnaService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes("adminUser")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping(value="/admin_login_form")
	public String adminLoginView() {
		
		return "admin/main";
	}
	
	@PostMapping(value="/admin_login")
	public String adminLogin(@RequestParam(value="workerId") String workerId,
							 @RequestParam(value="workerPwd") String workerPwd,
							 Model model) {
		
		WorkerVO vo = new WorkerVO();
		vo.setId(workerId);
		vo.setPwd(workerPwd);
		
		int result = adminService.workerCheck(vo);
		
		// 정상 로그인이면 상품 목록화면으로 이동
		if (result ==1) {
			WorkerVO adminUser = adminService.getEmployee(workerId);
			
			model.addAttribute("adminUser", adminUser);
			
			return "redirect:admin_product_list";
		} else { 
			// 비정상 로그인이면 메세지를 설정하고 로그인 페이지로 이동	
			if (result == 0) {
				model.addAttribute("message", "비밀번호를 확인하세요.");
		    } else {
		    	model.addAttribute("message", "아이디를 확인하세요!");
		    }
			
			return "admin/main";
		}
	}
	
	/*
	 * 관리자 계정 로그아웃 처리
	 */
	@GetMapping(value="/admin_logout")
	public String adminLogout(SessionStatus status) {
		
		status.setComplete();
		
		return "admin/main";
	}
	
	/*
	@GetMapping(value="/admin_product_list")
	public String adminProductList(HttpSession session, Model model) {
		// 관리자 로그인 확인
		WorkerVO adminUser = (WorkerVO)session.getAttribute("adminUser");
		
		if (adminUser == null) {
			return "admin/main";
		} else {
			// 상품목록 조회
			List<ProductVO> prodList = productService.listProduct("");
			
			model.addAttribute("productList", prodList);
			
			return "admin/product/productList";
		}
	}
	*/
	
	/*
	 *  페이지별 상품 목록 조회요청 처리
	 */
	@RequestMapping(value="/admin_product_list")
	public String adminProductList(
			@RequestParam(value="key", defaultValue="") String name,
			Criteria criteria, 
			HttpSession session, Model model) {
		// 관리자 로그인 확인
		WorkerVO adminUser = (WorkerVO)session.getAttribute("adminUser");
		
		if (adminUser == null) {
			return "admin/main";
		} else {
			// 상품목록 조회
			List<ProductVO> prodList = productService.getListWithPaging(criteria, name);
			
			// 화면에 표시할 페이지버튼 정보 설정
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria); // 현재 페이지와 페이지당 항목 수 정보 설정
			int totalCount = productService.countProductList(name);
			pageMaker.setTotalCount(totalCount); // 전체 상품목록 갯수 설정 및 페이지 정보 초기화
			System.out.println("[adminProductList] pageMaker="+pageMaker);
			
			model.addAttribute("productList", prodList);
			model.addAttribute("productListSize", prodList.size());
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/product/productList";
		}
	}
	
	/*
	 * 상품 등록페이지 표시
	 */
	@PostMapping(value="/admin_product_write_form")
	public String adminProductWriteView(Model model) {
		String kindList[] = {"크로스백", "클러치백", "파우치백", "토트백", "버킷백"};
		
		model.addAttribute("kindList", kindList);
		
		return "admin/product/productWrite";
	}
	
	/*
	 *  상품 등록 처리
	 */
	@PostMapping(value="/admin_product_write")
	public String adminProductWrite(@RequestParam(value="product_image") MultipartFile uploadFile,
									ProductVO vo, HttpSession session) {
		// 관리자 로그인 확인
		WorkerVO adminUser = (WorkerVO)session.getAttribute("adminUser");
				
		if (adminUser == null) {
			return "admin/main";
		} else {
			String fileName = "";
			if (!uploadFile.isEmpty()) {  // 이미지 파일을 읽어옴
				fileName = uploadFile.getOriginalFilename();
				// vo 객체에 이미지파일 저장
				vo.setImage(fileName);
				
				// 이미지 파일의 실제 저장경로 구하기
				String image_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
				System.out.println("이미지 경로: " + image_path);
							
				try {
					// 이미지 파일을 위의 경로로 이동시킴
					File dest = new File(image_path + fileName);
					uploadFile.transferTo(dest);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		productService.insertProduct(vo);
		
		return "redirect:admin_product_list";
	}
	
	/*
	 * 상품 상세 정보 출력
	 */
	
	@RequestMapping(value="/admin_product_detail")
	public String adminProductDetail(ProductVO vo, Model model) {
		String[] kindList = {"", "크로스백", "클러치백", "파우치백", "토트백", "버킷백"};
		
		ProductVO product = productService.getProduct(vo);
		
		model.addAttribute("productVO", product);
		
		// 상품종류 설정
		int index = Integer.parseInt(product.getKind());
		model.addAttribute("kind", kindList[index]);
		
		return "admin/product/productDetail";
	}
	
	/*
	 * 상품 수정화면 출력
	 */
	@PostMapping(value="/admin_product_update_form")
	public String adminProductUpdateView(ProductVO vo, Model model) {
		String[] kindList = {"크로스백", "클러치백", "파우치백", "토트백", "버킷백"};
		
		ProductVO product = productService.getProduct(vo);
		
		model.addAttribute("productVO", product);  // 화면에 전달할 상품상세정보
		model.addAttribute("kindList", kindList);
		
		return "admin/product/productUpdate";
	}
	
	/*
	 * 상품정보 수정
	 */
	@PostMapping(value="/admin_product_update")
	public String adminProductUpdate(@RequestParam(value="product_image") MultipartFile uploadFile,
				@RequestParam(value="nonmakeImg") String origImage,					  
				ProductVO vo, HttpSession session) {
		// 관리자 로그인 확인
		WorkerVO adminUser = (WorkerVO)session.getAttribute("adminUser");
						
		if (adminUser == null) {
			return "admin/main";
		} else {
			String fileName = "";
					
			// 이미지 파일을 수정 시 설정
			if (!uploadFile.isEmpty()) {  // 이미지 파일을 읽어옴
				fileName = uploadFile.getOriginalFilename();
				// vo 객체에 이미지파일 저장
				vo.setImage(fileName);
						
				// 이미지 파일의 실제 저장경로 구하기
				String image_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
				System.out.println("이미지 경로: " + image_path);
									
				try {
					// 이미지 파일을 위의 경로로 이동시킴
					File dest = new File(image_path + fileName);
					uploadFile.transferTo(dest);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				// 기존 이미지로 image 필드 설정
				vo.setImage(origImage);
			}
			// 베스트 상품, 신상품을 체크하지 않으면 값이 null로 들어옴
			if (vo.getUseyn() == null) {
				vo.setUseyn("n");
			}
			if (vo.getBestyn() == null) {
				vo.setBestyn("n");
			}
			
			productService.updateProduct(vo);
			
			return "redirect:admin_product_list";
		}
	}
	
	/*
	 *  주문목록 조회 요청처리
	 */
	@RequestMapping(value="/admin_order_list")
	public String adminOrderList(@RequestParam(value="key", defaultValue="") String key, Model model) {
		
		List<OrderVO> orderList = orderService.listOrder(key);
		
		model.addAttribute("orderList", orderList);
		
		return "admin/order/orderList";
	}
	
	/*
	 *  주문완료 처리(입금 확인)
	 *  입력 파라미터:
	 *  	입금확인한 result 필드의 상세주문번호(odesq) 배열이 전달됨
	 */
	@RequestMapping(value="/admin_order_save")
	public String adminOrderSave(@RequestParam(value="result") int[] odseq) {
		
		for(int i=0; i<odseq.length; i++) {
			orderService.updateOrderResult(odseq[i]);
		}
		
		return "redirect:admin_order_list";
	}
	
	/*
	 * 회원목록 조회 처리
	 */
	@RequestMapping(value="/admin_member_list")
	public String adminMemberList(@RequestParam(value="key", defaultValue="") String name, Model model) {
	
		
		List<MemberVO> listMember = memberService.listMember(name);
		
		model.addAttribute("memberList", listMember);
		
		return "admin/member/memberList";
	}
	
	/*
	 * Q&A 목록 조회 처리
	 */
	@RequestMapping(value="/admin_qna_list")
	public String adminQnaList(Model model) {
		
		// Q&A 목록을 테이블에서 조회
		List<QnaVO> qnaList = qnaService.listAllQna();
		
		// 조회 결과를 model 객체에 저장
		model.addAttribute("qnaList", qnaList);
		
		// QnA 화면 호출
		return "admin/qna/qnaList";
	}
	
	/*
	 *  클릭한 Qna게시글 상세 조회
	 */
	@PostMapping(value="/admin_qna_detail")
	public String adminQnaDetail(QnaVO vo, Model model) {
		// 게시글 일련번호를 조건으로 게시글 상세 조회
		QnaVO qna = qnaService.getQna(vo.getQseq());
		
		// 조회 결과를 model 객체에 저장
		model.addAttribute("qnaVO", qna);
		
		// 게시글 상세화면 호출
		return "admin/qna/qnaDetail";
	}
	
	/*
	 *  Q&A 관리자 답변 요청 처리
	 */
	@PostMapping(value="/admin_qna_repsave")
	public String adminQnaRepSave(QnaVO vo) {
		
		// Qna서비스의 Update 호출
		qnaService.updateQna(vo);
		
		// Qna 게시글 목록 호출
		return "redirect:admin_qna_list";
	}
	
	/*
	 *  상품별 판매 실적 화면 출력
	 */
	@RequestMapping(value="/admin_sales_record_form")
	public String adminProductSalesChart() {
		
		return "admin/order/salesRecord";
	}
	
	/*
	 * 차트를 위한 상품별 판매 실적 조회(JSON 데이터 포맷 전송)
	 */
	@RequestMapping(value="/sales_record_chart",
			produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<SalesQuantity> salesRecordChart() {
		
		return productService.getProductSales();
	}
	
}
