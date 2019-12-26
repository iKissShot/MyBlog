package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuhuiBaiduController {
	@RequestMapping("/Utils/Buhuibaidu/{params}")
	public String index(@PathVariable String params) {
		return "utils/_08_buhuibaidu/index?" + params;
	}

	@RequestMapping("/Utils/Buhuibaidu")
	public String index() {
		return "utils/_08_buhuibaidu/index";
	}
}