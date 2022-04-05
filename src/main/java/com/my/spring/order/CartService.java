package com.my.spring.order;

import java.util.List;

import com.my.spring.dto.CartVO;

public interface CartService {

	// 장바구니 담기
	void insertCart(CartVO vo);

	// 장바구니 목록
	List<CartVO> listCart(String userid);

	// 장바구니에서 항목 삭제
	void deleteCart(int cseq);
	
	void updateCart(int cseq);

}