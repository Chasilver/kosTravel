package gotrip.java.cart.service;

import java.util.List;

import gotrip.java.cart.vo.CartVO;


public interface CartService {
	public List<CartVO> cartSelect(CartVO cvo);
}
