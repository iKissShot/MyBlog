package top.kissshot.myblog.controller.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.Sort;
import top.kissshot.myblog.pojo.SortExample;

@Controller
public class IndexController {

	@Autowired
	UserMapper userMapper;

	@Autowired
	ArticleMapper articleMapper;

	@Autowired
	CommentMapper commentMapper;

	@Autowired
	SortMapper sortMapper;

	@Autowired
	LabelMapper labelMapper;

	@RequestMapping("/")
	public String index() throws Exception {
		return "redirect:/dev/index";
	}

	@RequestMapping("web/index")
	public String webIndex(Model model) throws Exception {
		return "web/index";
	}

	@RequestMapping("dev/index")
	public String devIndex(Model model) throws Exception {
//		所有文章
		List<Sort> sorts = sortMapper.selectByExample(new SortExample());
		List<Article> articles = new ArrayList<Article>();
		List<Integer> articleCounts = new ArrayList<>();
		model.addAttribute("sorts", sorts);
		for (int i = 0; i < sorts.size(); i++) {
			int sid = sorts.get(i).getSid();
//			List<Article> articles = articleMapper.selectByExample(new ArticleExample());
//			model.addAttribute("articleCountBySid" + i, articles.size());
//			if (articles.size() >= 3)
//				articles = articles.subList(0, 3);
//			model.addAttribute("articlesBySid" + i, articles);
			List<Article> temp = articleMapper.listBySid(sid);
			articleCounts.add(temp.size());
			articles.addAll((temp.size() > 3 ? temp.subList(0, 3) : temp));
		}
		model.addAttribute("articles", articles);
		model.addAttribute("articleCounts", articleCounts);

		return "dev/index";
	}
}