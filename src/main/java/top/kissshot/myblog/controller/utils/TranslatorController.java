package top.kissshot.myblog.controller.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TranslatorController {
	@RequestMapping("/Utils/Translator")
	public String index() {
		return "utils/_10_translator/index";
	}
}