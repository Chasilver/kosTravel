package gotrip.java.cart.dao;

import java.util.List;

import gotrip.java.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartSelect(CartVO cvo);
}
