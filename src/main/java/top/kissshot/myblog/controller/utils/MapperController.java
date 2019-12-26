package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapperController {
	@RequestMapping("/Utils/Mapper")
	public String index() {
		return "utils/_11_mapper/index";
	}
}