package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoderController {
	@RequestMapping("/Utils/Coder")
	public String index() {
		return "utils/_07_coder/index";
	}
}