package top.kissshot.myblog.controller.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimeController {
	@RequestMapping("/Utils/Time")
	public String index(Model model) {
		model.addAttribute("from", "/utils/TimeController");
		model.addAttribute("nowTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:SS").format(new Date()));
		return "utils/_01_time/index";
	}

	@RequestMapping("/Utils/Time/RomaClock")
	public String RomaClock(Model model) {
		return "utils/_01_time/RomaClock";
	}

	@RequestMapping("/Utils/Time/JSClock")
	public String JSClock(Model model) {
		return "utils/_01_time/JSClock";
	}
}