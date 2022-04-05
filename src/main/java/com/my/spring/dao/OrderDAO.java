package com.my.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.dto.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxOseq() {
		
		return mybatis.selectOne("mappings.order-mapping.selectMaxOseq");
	}
	
	public void insertOrder(OrderVO vo) {
		
		mybatis.insert("mappings.order-mapping.insertOrder", vo);
	}
	
	public void insertOrderDetail(OrderVO vo) {
		
		mybatis.insert("mappings.order-mapping.insertOrderDetail", vo);
	}
	
	public List<OrderVO> listOrderByID(OrderVO vo) {
		System.out.println("OrderDAO: " + vo);
		
		List<OrderVO> oList =  mybatis.selectList("mappings.order-mapping.listOrderById", vo);
		
		for(int i =0; i<oList.size(); i++) {
			System.out.println(oList.get(i));
		}
		return mybatis.selectList("mappings.order-mapping.listOrderById", vo);
	}
	
	public List<Integer> selectSeqOrdering(OrderVO vo) {
		
		return mybatis.selectList("mappings.order-mapping.selectSeqOrdering", vo);
	}
	
	public List<OrderVO> listOrder(String key) {
		
		return mybatis.selectList("mappings.order-mapping.listOrder", key);
	}
	
	public void updateOrderResult(int odseq) {
		
		mybatis.update("mappings.order-mapping.updateOrderResult", odseq);
	}
}
