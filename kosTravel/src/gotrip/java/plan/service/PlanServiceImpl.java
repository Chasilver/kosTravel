package gotrip.java.plan.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gotrip.java.plan.dao.PlanDAO;
import gotrip.java.plan.vo.PlanVO;

@Service
@Transactional
public class PlanServiceImpl implements PlanService {

Logger logger = LogManager.getLogger(PlanServiceImpl.class);
	
	@Autowired(required=false)		
	private PlanDAO planDAO;
	
	@Override
	public int planInsert(PlanVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PlanServiceImpl planInsert 함수 진입 >>> : ");			
		return planDAO.planInsert(pvo);
	}

	@Override
	public PlanVO chabunquery_plan() {
		// TODO Auto-generated method stub
		logger.info("PlanServiceImpl chabunquery_plan 함수 진입 >>> : ");		
		return planDAO.chabunquery_plan();
	}

	@Override
	public List<PlanVO> planSelectAll(PlanVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PlanServiceImpl planSelectAll 함수 진입 >>> : ");			
		return planDAO.planSelectAll(pvo);
	}

	@Override
	public int planDelete(PlanVO pvo) {
		// TODO Auto-generated method stub
		return planDAO.planDelete(pvo);
	}

	@Override
	public PlanVO planSelect(PlanVO pvo) {
		// TODO Auto-generated method stub
		return planDAO.planSelect(pvo);
	}

	@Override
	public List<PlanVO> plocationSelect(PlanVO pvo) {
		// TODO Auto-generated method stub
		logger.info("PlanServiceImpl plocationSelect 함수 진입 >>> : ");			
		return planDAO.plocationSelect(pvo);
	}

}
