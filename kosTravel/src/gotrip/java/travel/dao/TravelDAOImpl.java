package gotrip.java.travel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gotrip.java.travel.vo.TravelVO;


@Repository
public class TravelDAOImpl implements TravelDAO {

	Logger logger = LogManager.getLogger(TravelDAOImpl.class);

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public int travelInsert(TravelVO tvo) {
		// TODO Auto-generated method stub
		logger.info("PlanDAOImpl planInsert 함수 진입 >>> : ");
		return (Integer) sqlSession.insert("travelInsert", tvo);
	}

	@Override
	public TravelVO chabunquery_travel() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chabunquery_travel");
	}

	@Override
	public List<TravelVO> travelSelectAll(TravelVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("travelSelectAll", tvo);
	}

	@Override
	public List<TravelVO> travelSelect(TravelVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("travelSelect");
	}

}
