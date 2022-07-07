package gotrip.java.plan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gotrip.java.plan.vo.PlanVO;

@Repository
public class PlanDAOImpl implements PlanDAO {

	Logger logger = LogManager.getLogger(PlanDAOImpl.class);

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public int planInsert(PlanVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PlanDAOImpl planInsert 함수 진입 >>> : ");
		return (Integer) sqlSession.insert("planInsert", pvo);
	}

	@Override
	public PlanVO chabunquery_plan() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chabunquery_plan");
	}


	@Override
	public List<PlanVO> planSelectAll(PlanVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("planSelectAll", pvo);
	}

	@Override
	public int planDelete(PlanVO pvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("planDelete", pvo);
	}

	@Override
	public PlanVO planSelect(PlanVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("planSelect");
	}

	@Override
	public List<PlanVO> plocationSelect(PlanVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("plocationSelect", pvo);
	}

}
