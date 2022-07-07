package gotrip.java.travel.vo;

public class TravelVO {
	
	private String tnum;
	private String mnum;
	private String tname;
	private String tstartdate;
	private String tenddate;
	
	public TravelVO() {
		// TODO Auto-generated constructor stub
	}

	public TravelVO(String tnum, String mnum, String tname, String tstartdate, String tenddate) {
		this.tnum = tnum;
		this.mnum = mnum;
		this.tname = tname;
		this.tstartdate = tstartdate;
		this.tenddate = tenddate;
	}

	public String getTnum() {
		return tnum;
	}

	public String getMnum() {
		return mnum;
	}

	public String getTname() {
		return tname;
	}

	public String getTstartdate() {
		return tstartdate;
	}

	public String getTenddate() {
		return tenddate;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public void setTstartdate(String tstartdate) {
		this.tstartdate = tstartdate;
	}

	public void setTenddate(String tenddate) {
		this.tenddate = tenddate;
	}

	
	
}
