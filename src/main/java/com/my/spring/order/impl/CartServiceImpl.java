package com.my.spring.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.dao.CartDAO;
import com.my.spring.dto.CartVO;
import com.my.spring.order.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDao;
	
	@Override
	public void insertCart(CartVO vo) {
		
		cartDao.insertCart(vo);
	}

	@Override
	public List<CartVO> listCart(String userid) {
		
		return cartDao.listCart(userid);
	}

	@Override
	public void deleteCart(int cseq) {
		
		cartDao.deleteCart(cseq);
	}

	@Override
	public void updateCart(int cseq) {
		
		cartDao.updateCart(cseq);
	}

}
