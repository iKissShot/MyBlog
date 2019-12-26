package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IconController {
	@RequestMapping("/Utils/Icon")
	public String index() {
		System.err.println("path:" + this.getClass().getResource("").getPath());
		return "utils/_05_icon/index";
	}
}