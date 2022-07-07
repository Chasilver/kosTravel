package gotrip.java.travel.dao;

import java.util.List;

import gotrip.java.travel.vo.TravelVO;

public interface TravelDAO {
	public int travelInsert(TravelVO tvo);
	public TravelVO chabunquery_travel();
	public List<TravelVO> travelSelectAll(TravelVO tvo);
	public List<TravelVO> travelSelect(TravelVO tvo);
}
