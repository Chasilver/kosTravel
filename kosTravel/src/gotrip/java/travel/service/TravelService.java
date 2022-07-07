package gotrip.java.travel.service;

import java.util.List;

import gotrip.java.travel.vo.TravelVO;

public interface TravelService {
	public int travelInsert(TravelVO tvo);
	public TravelVO chabunquery_travel();
	public List<TravelVO> travelSelectAll(TravelVO tvo);
	public List<TravelVO> travelSelect(TravelVO tvo);
}
