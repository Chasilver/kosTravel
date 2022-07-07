package gotrip.java.weather.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WeatherController {
Logger logger = LogManager.getLogger(WeatherController.class);
	
	@GetMapping(value="flask_test2")
	public ModelAndView flask_test() {
		
		ModelAndView mav = new ModelAndView();
		
		String url = "http://localhost:5000/aa";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

			String line = null;

			while ((line = br.readLine()) != null) {
				logger.info("line >>>>>>>>>>>>>>>>>>>>>>>>>>> ::   " + line);
				
				sb = sb + line + "\n";
			}
			
			logger.info("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				logger.info("test");				
			}
			br.close();

			logger.info("" + sb.toString());
		} catch (Exception e) {			
			logger.info("err >>> : " + e.getMessage());
		}
		
		
		mav.addObject("test1", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, 
		mav.addObject("fail", false);
		mav.setViewName("weather/jsp_flask2");   
		
		return mav;
	}
	
	//weatherInsertForm 입력창
	@GetMapping(value="weatherInsertForm")
	public String weatherInsertForm(Model m ,HttpServletRequest req) {
		
		String city = req.getParameter("city");
		String weather = req.getParameter("weather");
		String time = req.getParameter("time");
		
		logger.info(city);
		logger.info(weather);
		logger.info(time);

		
		m.addAttribute("city", city);
		m.addAttribute("weather", weather);
		m.addAttribute("time", time);

		
		logger.info("WeatherController.weatherInsertForm >>> :");
		
		return "weather/weatherInsertForm";
	}//end hotelInsertForm
	
	
	
	
}
