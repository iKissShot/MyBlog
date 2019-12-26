package top.kissshot.myblog.controller.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.ColorPlattesMapper;
import top.kissshot.myblog.pojo.ColorPlattes;
import top.kissshot.myblog.pojo.ColorPlattesExample;

@Controller
public class ColorController {
	@Autowired
	ColorPlattesMapper colorMapper;

	@RequestMapping("/Utils/Color")
	public String index(HttpServletRequest req) {
		ColorPlattesExample example = new ColorPlattesExample();
		example.setOrderByClause("likeCount DESC");
		List<ColorPlattes> list = colorMapper.selectByExample(example);
		req.setAttribute("colors", list);

		System.err.println(list.size());

		return "/utils/_04_color/index";
	}
}