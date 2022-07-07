package gotrip.java.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_PLAN = "P";
	public static final String BIZ_GUBUN_TRAVEL = "T";
	
	public static String numPad(String c) {
		
		for(int i = c.length(); i < 4; i++) {
			c = "0" + c;
		}
		String ymd = new SimpleDateFormat("yyyyMMdd").format(new Date());
		return ymd.concat(c);
	}
	
	public static String getPlanChabun(String commNum) {
		
		return BIZ_GUBUN_PLAN.concat(ChabunUtil.numPad(commNum));
	}
	
public static String getTravelChabun(String commNum) {
		
		return BIZ_GUBUN_TRAVEL.concat(ChabunUtil.numPad(commNum));
	}


}
