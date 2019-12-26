package top.kissshot.myblog.controller.web;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;

@Controller
public class TimeLineController {

	@Autowired
	ArticleMapper articleMapper;

	@RequestMapping("/dev/timeLine")
	public String LineController(Model model) {
		List<Article> articles = articleMapper.selectByExample(new ArticleExample());
		Collections.sort(articles, new Comparator<Article>() {

			@Override
			public int compare(Article o1, Article o2) {
				o1.transEasyDate();
				o2.transEasyDate();
				return o2.getDate().compareTo(o1.getDate());
			}
		});
		model.addAttribute("articles", articles);

		return "dev/timeLine";
	}
}