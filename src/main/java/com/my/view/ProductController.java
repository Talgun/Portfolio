package com.my.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.my.spring.dto.ProductVO;
import com.my.spring.product.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	//@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	@GetMapping(value="/product_detail")
	public String productDetailAction(ProductVO vo, Model model) {     // ~호출할때 model 씀
		
		// 제품 상세 조회
		ProductVO product = productService.getProduct(vo);
		
		model.addAttribute("productVO", product);
		
		return "product/productDetail";
	}
	
	@GetMapping(value="/category")
	public String productKindAction(ProductVO vo, Model model) {
		
		List<ProductVO> listProduct = productService.getProductListByKind(vo);
		
		model.addAttribute("productKindList", listProduct);
		
		return "product/productKind";
	}
}
