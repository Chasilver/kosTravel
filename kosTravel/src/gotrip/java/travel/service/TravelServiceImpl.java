package gotrip.java.travel.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gotrip.java.travel.dao.TravelDAO;
import gotrip.java.travel.dao.TravelDAOImpl;
import gotrip.java.travel.vo.TravelVO;

@Service
@Transactional
public class TravelServiceImpl implements TravelService {
	
	Logger logger = LogManager.getLogger(TravelDAOImpl.class);
	
	@Autowired(required=false)	
	private TravelDAO travelDAO;

	@Override
	public int travelInsert(TravelVO tvo) {
		// TODO Auto-generated method stub
		logger.info("TravelServiceImpl travelInsert 함수 진입 >>> : ");			
		return travelDAO.travelInsert(tvo);
	}

	@Override
	public TravelVO chabunquery_travel() {
		// TODO Auto-generated method stub
		logger.info("TravelServiceImpl chabunquery_travel 함수 진입 >>> : ");			
		return travelDAO.chabunquery_travel();
	}

	@Override
	public List<TravelVO> travelSelectAll(TravelVO tvo) {
		// TODO Auto-generated method stub
		logger.info("TravelServiceImpl travelSelectAll 함수 진입 >>> : ");	
		return travelDAO.travelSelectAll(tvo);
	}

	@Override
	public List<TravelVO> travelSelect(TravelVO tvo) {
		// TODO Auto-generated method stub
		return travelDAO.travelSelect(tvo);
	}
	
	
}
