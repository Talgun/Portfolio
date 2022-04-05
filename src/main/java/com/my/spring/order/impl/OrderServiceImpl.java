package com.my.spring.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.dao.OrderDAO;
import com.my.spring.dto.CartVO;
import com.my.spring.dto.OrderVO;
import com.my.spring.order.CartService;
import com.my.spring.order.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO oDao;
	@Autowired
	private CartService cartService;
	
	@Override
	public int selectMaxOseq() {
	
		return oDao.selectMaxOseq();
	}

	/*
	 *  주문 저장후 주문번호를 반환한다.
	 */
	@Override
	public int insertOrder(OrderVO vo) {
		// (1) 주문번호를 할당 받는다.
		int oseq = selectMaxOseq();
		
		// (2) 위의 주문번호를 가지고 주문을 생성
		vo.setOseq(oseq);
		oDao.insertOrder(vo);
		
		// (3) 장바구니 목록을 읽어서 주문상세 내역을 저장
		// (3-1) 장바구니 목록을 읽어온다.
		List<CartVO> cartList = cartService.listCart(vo.getId());
		
		// (3-2) 장바구니 내역을 주문 상세 테이블에 저장
		for(CartVO cartVO : cartList) {
			OrderVO order = new OrderVO();
			order.setOseq(oseq);
			order.setPseq(cartVO.getPseq());  // 장바구니의 상품번호
			order.setQuantity(cartVO.getQuantity()); // 장바구니 상품 수량
			
			insertOrderDetail(order);
			
			// 장바구니 테이블 업데이트(처리결과를 '처리완료'로)
			cartService.updateCart(cartVO.getCseq());
		}
		
		return oseq;
	}

	@Override
	public void insertOrderDetail(OrderVO vo) {
		
		oDao.insertOrderDetail(vo);
	}

	@Override
	public List<OrderVO> listOrderById(OrderVO vo) {
		
		return oDao.listOrderByID(vo);
	}

	@Override
	public List<Integer> selectSeqOrdering(OrderVO vo) {
		
		return oDao.selectSeqOrdering(vo);
	}

	@Override
	public List<OrderVO> listOrder(String key) {
		
		return oDao.listOrder(key);
	}

	@Override
	public void updateOrderResult(int odseq) {
		
		oDao.updateOrderResult(odseq);
	}

}