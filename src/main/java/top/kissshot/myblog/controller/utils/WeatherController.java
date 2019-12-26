package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {

	@RequestMapping("/Utils/Weather")
	public String index() {
		return "utils/_03_weather/index";
	}
}