package gotrip.java.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import gotrip.java.cart.service.CartService;
import gotrip.java.cart.vo.CartVO;
import gotrip.java.plan.controller.PlanController;
import gotrip.java.travel.service.TravelService;
import gotrip.java.travel.vo.TravelVO;

@Controller
public class MyPageController {
	Logger logger = LogManager.getLogger(PlanController.class);
	
	// 필드 오토와이어드
	@Autowired(required=false)
	private CartService cartService;
	
	// 필드 오토와이어드
	@Autowired(required = false)
	private TravelService travelService;
	
		
	@GetMapping("myPageSelectAll")
	public String myPageSelectAll (HttpServletRequest req, CartVO cvo, TravelVO tvo, Model model) {
		logger.info("MyPageController myPageSelectAll 함수 진입 >>> :");
		
		cvo.setMnum("M202206260001");
		tvo.setMnum("M202206260001");
		logger.info(cvo.getMnum());
		
		List<CartVO> listC = cartService.cartSelect(cvo);
		// 서비스 호출
		List<TravelVO> listAll = travelService.travelSelectAll(tvo);
		ModelAndView mav = new ModelAndView("travel/travelSelectAll");
	
		logger.info(listC.get(0).getCaraddr());
		if(listC.size() > 0 && listAll.size() > 0) {
			model.addAttribute("listC",listC);
			model.addAttribute("listAll", listAll);
			logger.info(listC.get(0).getCaraddr());
			return "myPage/myPageSelectAll";
		}
		return "myPage/myPageSelectAll";
	}
	
}
