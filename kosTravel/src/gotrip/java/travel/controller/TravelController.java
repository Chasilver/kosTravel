package gotrip.java.travel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import gotrip.java.common.ChabunUtil;
import gotrip.java.plan.controller.PlanController;
import gotrip.java.travel.service.TravelService;
import gotrip.java.travel.vo.TravelVO;

@Controller
public class TravelController {

	Logger logger = LogManager.getLogger(PlanController.class);

	// 필드 오토와이어드
	@Autowired(required = false)
	private TravelService travelService;
	
	@GetMapping("travelInsertForm")
	public String travelInsertForm () {
		logger.info("TravelController travelInsertForm 함수 진입 >>> :");
		return "travel/travelInsertForm";
	}
	
	@GetMapping("travelInsert")
	public String travelInsert (TravelVO tvo, HttpServletRequest req) throws ParseException {
		logger.info("TravelController travelInsert 함수 진입 >>> :");
		tvo.setMnum("M202206260001");
		// 채번 구하기
		String tnum = ChabunUtil.getPlanChabun(travelService.chabunquery_travel().getTnum());
		tvo.setTnum(tnum);
		logger.info("PlanController planInsert tnum >>> : " + tnum);
		logger.info("tvo.getTstartdate() >>> : " + tvo.getTstartdate());
		//String tstartdate = tvo.getTstartdate();
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(tvo.getTstartdate());
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(tvo.getTenddate());
        long calDate = format2.getTime() - format1.getTime(); 
 
        int pday_i = ((int) (calDate / (24*60*60*1000)))+1; //일자수 차이
        String pday = Integer.toString(pday_i);
        logger.info("pday가 몇이라구??? >>> : " + pday);
		int nCnt = travelService.travelInsert(tvo);
		if(nCnt > 0) {
			logger.info("TravelController travelInsert nCnt >>> : " + nCnt);
			req.setAttribute("pday", pday);
			//req.setAttribute("tstartdate", tstartdate);
			req.setAttribute("tnum", tnum);
			return "travel/travelInsert";
			
		}
		return "travel/travelInsert";
	}
	
		// -------------------- 일정 전체 조회 ----------------------
		@GetMapping("travelSelectAll")
		public ModelAndView travelSelectAll(TravelVO tvo, Model model, HttpServletRequest req) {
			logger.info("TravelController travelSelectAll 함수 진입 >>> : ");
			tvo.setMnum("M202206260001");

			// 서비스 호출
			List<TravelVO> listAll = travelService.travelSelectAll(tvo);
			ModelAndView mav = new ModelAndView("travel/travelSelectAll");
		
			if (listAll.size() > 0) {
				logger.info("TravelController travelSelectAll listAll.size() >>> : " + listAll.size());
				model.addAttribute("listAll", listAll);
				return mav;
			}
			else {
				ModelAndView mav_1 = new ModelAndView("travel/travelInsertForm");
				return mav_1;
			}
			
		}

}
