package com.my.spring.order;

import java.util.List;

import com.my.spring.dto.OrderVO;

public interface OrderService {

	int selectMaxOseq();

	int insertOrder(OrderVO vo);

	void insertOrderDetail(OrderVO vo);
	
	public List<OrderVO> listOrderById(OrderVO vo);
	
	public List<Integer> selectSeqOrdering(OrderVO vo);
	
	public List<OrderVO> listOrder(String key);
	
	public void updateOrderResult(int odseq);

}