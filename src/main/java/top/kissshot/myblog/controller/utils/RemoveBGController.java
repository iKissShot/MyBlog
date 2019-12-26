package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RemoveBGController {

	@RequestMapping("/Utils/RemoveBG")
	public String index() {
		return "utils/_09_removeBG/index";
	}

}