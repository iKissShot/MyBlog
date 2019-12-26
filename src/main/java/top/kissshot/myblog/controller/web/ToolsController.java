package top.kissshot.myblog.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToolsController {
	@RequestMapping("/dev/tools")
	public String tools() {
		return "utils/tools";
	}
}