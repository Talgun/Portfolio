package com.my.spring.product;

import java.util.List;

import com.my.spring.dto.ProductVO;
import com.my.spring.dto.SalesQuantity;

import utils.Criteria;

public interface ProductService {

	List<ProductVO> getNewProductList();

	List<ProductVO> getBestProductList();

	ProductVO getProduct(ProductVO vo);

	List<ProductVO> getProductListByKind(ProductVO vo);
	
	public int countProductList(String name);
	
	public List<ProductVO> listProduct(String name);
	
	public void insertProduct(ProductVO vo);
	
	public void updateProduct(ProductVO vo);
	
	public List<ProductVO> getListWithPaging(Criteria criteria, String name);
	
	public List<SalesQuantity> getProductSales();

}