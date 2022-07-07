package gotrip.java.plan.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import gotrip.java.common.ChabunUtil;
import gotrip.java.plan.service.PlanService;
import gotrip.java.plan.vo.PlanVO;
import gotrip.java.travel.service.TravelService;
import gotrip.java.travel.vo.TravelVO;

@CrossOrigin(origins = "http://localhost:8088")
@RestController
public class PlanController {

	Logger logger = LogManager.getLogger(PlanController.class);

	// 필드 오토와이어드
	@Autowired(required = false)
	private PlanService planService;
	// 필드 오토와이어드
	@Autowired(required = false)
	private TravelService travelService;

	// ---------------------- 장소 검색 -------------------------
	@GetMapping("location")
	public ModelAndView location(HttpServletRequest req) {
		logger.info("PlanController location 함수 진입 >>> : ");
		String pday = req.getParameter("pday");	
		String tnum = req.getParameter("tnum");
		logger.info("location pday >>> : " + pday);
		logger.info("location tnum >>> : " + tnum);
		req.setAttribute("pday", pday);
		req.setAttribute("tnum", tnum);
		ModelAndView mav = new ModelAndView("plan/location");
		return mav;
	}
	
	// ---------------------- 위치 등록 --------------------------
	@GetMapping("locationInsert")
	public ModelAndView locationInsert(HttpServletRequest req) {
		logger.info("PlanController locationInsert 함수 진입 >>> : ");
		String pname = req.getParameter("pname");
		String ploaction = req.getParameter("ploaction");
		String pday = req.getParameter("pday");	
		String tnum = req.getParameter("tnum");
		logger.info("locationInsert pday >>> : " + pday);
		logger.info("locationInsert tnum >>> : " + tnum);
		logger.info("locationInsert pname >>> : " + pname);
		req.setAttribute("pname", pname);
		req.setAttribute("ploaction", ploaction);
		req.setAttribute("pday", pday);
		req.setAttribute("tnum", tnum);
		ModelAndView mav = new ModelAndView("plan/locationInsert");
		return mav;
	}
	// ------------------ 일정관리 등록 --------------------------
	@GetMapping("planInsert")
	public ModelAndView planInsert(HttpServletRequest req) {
		logger.info("PlanController planInsert 함수 진입 >>> : ");
		String pname = req.getParameter("pname");
		String ploaction = req.getParameter("ploaction");
		String pmemo = req.getParameter("pmemo");
		String pday = req.getParameter("pday");	
		String tnum = req.getParameter("tnum");
		logger.info("planInsert pname >>> : " + pname);
		logger.info("planInsert pday >>> : " + pday);
		logger.info("planInsert tnum >>> : " + tnum);
		// 채번 구하기
		String pnum = ChabunUtil.getPlanChabun(planService.chabunquery_plan().getPnum());
		logger.info("PlanController planInsert pnum >>> : " + pnum);

		PlanVO _pvo = null;
		_pvo = new PlanVO();

		_pvo.setPnum(pnum);
		_pvo.setMnum("M202206260001");
		_pvo.setPday(pday);
		_pvo.setPlocation(ploaction);
		_pvo.setPname(pname);
		_pvo.setPmemo(pmemo);
		_pvo.setTnum(tnum);
		req.setAttribute("pname", pname);
		req.setAttribute("ploaction", ploaction);
		req.setAttribute("pday", pday);
		req.setAttribute("tnum", tnum);
		int nCnt = planService.planInsert(_pvo);
		ModelAndView mav = new ModelAndView("travel/travelInsert");
		ModelAndView mav_1 = new ModelAndView("plan/location");
		if (nCnt > 0) {
			logger.info("PlanController planInsert nCnt >>> : " + nCnt);
			
			return mav;
		}
		return mav_1;

		}
	// -------------------- 일정 전체 조회 ----------------------
	@GetMapping("planSelectAll")
	public ModelAndView planSelectAll(PlanVO pvo, Model model, HttpServletRequest req) throws ParseException {
		logger.info("PlanController planSelectAll 함수 진입 >>> : ");
		pvo.setMnum("M202206260001");
		
		String pday = req.getParameter("pday");
		String tnum = req.getParameter("tnum");
		logger.info("planSelectAll pday >>> : " + pday);
		//int maxday = Integer.parseInt(pday);
		TravelVO tvo = new TravelVO();
		tvo.setTnum(tnum);
		List<TravelVO> travelList = travelService.travelSelect(tvo);
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(travelList.get(0).getTstartdate());
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(travelList.get(0).getTenddate());
        long calDate = format2.getTime() - format1.getTime(); 
 
        int pday_i = ((int) (calDate / (24*60*60*1000)))+1; //일자수 차이
        int maxday = pday_i;
		pvo.setTnum(tnum);
		logger.info("maxday >> " + maxday);
		// 서비스 호출
		List<PlanVO> listAll = planService.planSelectAll(pvo);
		ModelAndView mav = new ModelAndView("plan/planSelectAll");
	
		if (listAll.size() > 0) {
			logger.info("PlanController planSelectAll listAll.size() >>> : " + listAll.size());
			model.addAttribute("maxday", maxday);
			model.addAttribute("listAll", listAll);
			req.setAttribute("tnum", tnum);
			
			return mav;
		}
		else {
			ModelAndView mav_1 = new ModelAndView("plan/location");
			req.setAttribute("pday", "1");
			req.setAttribute("tnum", tnum);
			return mav_1;
		}
		
	}
	// --------------------- 일정 삭제 ---------------------------
	@GetMapping("planDelete")
	public ModelAndView plamDelete(PlanVO pvo, HttpServletRequest req) {
		logger.info("PlanController plamDelete 함수 진입 >>> : ");
		String pday = pvo.getPday();
		String tnum = pvo.getTnum();
		// 서비스 호출
		int nCnt = planService.planDelete(pvo);
		logger.info("PlanController plamDelete nCnt >>> : " + nCnt);
		ModelAndView mav = new ModelAndView("plan/planDelete");
		if (nCnt > 0) {
			req.setAttribute("pday", pday);
			req.setAttribute("tnum", tnum);
			return mav;
		}
		return mav;
	}
	
	// ------------------ 일정에서 위치 뽑아오기 ----------------------- 
	@PostMapping("planSelect")
	public String planSelect(PlanVO pvo, HttpServletRequest req) {
		logger.info("PlanController planSelect 함수 진입 >>> : ");
		pvo.setMnum("M202206260001");
		String tnum = req.getParameter("tnum");
		logger.info("얘는 잘 넘어가???? " + tnum);
		pvo.setTnum(tnum);
		//_pvo.setPday(pday);
		List<PlanVO> plocationList = planService.plocationSelect(pvo);
		
		String ss = "";
		String ssSum = "";
		if (plocationList !=null && plocationList.size() > 0) {
			logger.info("PlanController planSelect 함수 진입 >>> : " + plocationList.size());
			
			for (int i=0; i < plocationList.size();  i ++) {
				PlanVO _pvo = plocationList.get(i);
				logger.info(_pvo.getPlocation());
				ss = _pvo.getPlocation();
				ssSum += ss + ",";
			}
			
		}else {
			logger.info("데이터가 >>>> ; ");
		}
		
		return ssSum;
	}
}
