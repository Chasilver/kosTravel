package gotrip.java.plan.service;

import java.util.List;

import gotrip.java.plan.vo.PlanVO;

public interface PlanService {
	public int planInsert(PlanVO _pvo);
	public PlanVO chabunquery_plan();
	public List<PlanVO> planSelectAll(PlanVO bvo);
	public List<PlanVO> plocationSelect(PlanVO bvo);
	public int planDelete(PlanVO pvo);
	public PlanVO planSelect(PlanVO pvo);
}
