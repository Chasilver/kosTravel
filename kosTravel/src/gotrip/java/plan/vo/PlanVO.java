package gotrip.java.plan.vo;

public class PlanVO {

	private String pnum;
	private String tnum;
	private String mnum;
	private String pday;
	private String plocation;
	private String pname;
	private String pmemo;
	private String insertdate;
	private String updatedate;
	
	private int maxday;
	
	public PlanVO() {
		// TODO Auto-generated constructor stub
	}

	public PlanVO(String pnum, String tnum, String mnum, String pday, String plocation, String pname, String pmemo,
			String insertdate, String updatedate, int maxday) {
		
		this.pnum = pnum;
		this.tnum = tnum;
		this.mnum = mnum;
		this.pday = pday;
		this.plocation = plocation;
		this.pname = pname;
		this.pmemo = pmemo;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.maxday = maxday;
	}

	public String getPnum() {
		return pnum;
	}

	public String getTnum() {
		return tnum;
	}

	public String getMnum() {
		return mnum;
	}

	public String getPday() {
		return pday;
	}

	public String getPlocation() {
		return plocation;
	}

	public String getPname() {
		return pname;
	}

	public String getPmemo() {
		return pmemo;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public int getMaxday() {
		return maxday;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setPday(String pday) {
		this.pday = pday;
	}

	public void setPlocation(String plocation) {
		this.plocation = plocation;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setPmemo(String pmemo) {
		this.pmemo = pmemo;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public void setMaxday(int maxday) {
		this.maxday = maxday;
	}

}
