package gotrip.java.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gotrip.java.cart.service.CartService;
import gotrip.java.cart.vo.CartVO;

@Controller
public class CartController {
	
	Logger logger = Logger.getLogger(CartController.class);
	// 필드 오토와이어드
	@Autowired(required=false)
	private CartService cartService;
	
	@GetMapping("cartSelect")
	public String cartSelect(HttpServletRequest req, CartVO cvo, Model model) {
		logger.info("CartController cartSelect 함수 진입 >>> ");
		//String mnum = req.getParameter("mnum");
		cvo.setMnum("M202206260001");
		logger.info(cvo.getMnum());
		
		List<CartVO> listC = cartService.cartSelect(cvo);
		
		logger.info(listC.get(0).getCaraddr());
		if(listC.size()==1) {
			model.addAttribute("listC",listC);
			
			logger.info(listC.get(0).getCaraddr());
			return "cart/cartSelect";
		}
		return "cart/cartSelect";
	}
	// 주문 입력 폼
	@GetMapping("orderInsertForm")
	public String orderInsertForm() {
		logger.info("CartController orderInsertForm 함수 진입 >>> : ");
		
		return "cart/orderInsertForm";
	}
	
}
