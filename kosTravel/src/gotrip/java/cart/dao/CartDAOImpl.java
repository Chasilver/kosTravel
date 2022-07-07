package gotrip.java.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gotrip.java.cart.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	Logger logger = Logger.getLogger(CartDAOImpl.class);
	@Autowired(required=false)
	private SqlSession sqlSession;
	@Override
	public List<CartVO> cartSelect(CartVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cartSelect");
	}

}
