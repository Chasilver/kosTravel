package gotrip.java.cart.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gotrip.java.cart.dao.CartDAO;
import gotrip.java.cart.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	Logger logger = Logger.getLogger(CartServiceImpl.class);
	
	@Autowired(required=false)
	private CartDAO cartDAO;
	
	@Override
	public List<CartVO> cartSelect(CartVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CartServiceImpl cartSelect 오낭??");
		return cartDAO.cartSelect(cvo);
	}

}
