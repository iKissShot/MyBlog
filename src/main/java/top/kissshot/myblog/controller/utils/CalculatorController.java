package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalculatorController {
	@RequestMapping("/Utils/Calculator")
	public String index() {
		return "utils/_06_calculator/index";
	}
}