package gotrip.java.plan.dao;

import java.util.List;

import gotrip.java.plan.vo.PlanVO;

public interface PlanDAO {
	public int planInsert(PlanVO pvo);
	public PlanVO chabunquery_plan();
	public List<PlanVO> planSelectAll(PlanVO pvo);
	public List<PlanVO> plocationSelect(PlanVO pvo);
	public int planDelete(PlanVO pvo);
	public PlanVO planSelect(PlanVO pvo);
}
