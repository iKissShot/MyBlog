package top.kissshot.myblog.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.ArticleExample;
import top.kissshot.myblog.pojo.CommentExample;
import top.kissshot.myblog.pojo.LabelExample;
import top.kissshot.myblog.pojo.SortExample;
import top.kissshot.myblog.pojo.UserExample;

@Controller
public class FooterController {

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

	@RequestMapping("/dev/footer")
	public String footer(Model model) {

		model.addAttribute("userCount", userMapper.selectByExample(new UserExample()).size());
		model.addAttribute("articleCount", articleMapper.selectByExample(new ArticleExample()).size());
		model.addAttribute("commentCount", commentMapper.selectByExample(new CommentExample()).size());
		model.addAttribute("sortCount", sortMapper.selectByExample(new SortExample()).size());
		model.addAttribute("labelCount", labelMapper.selectByExample(new LabelExample()).size());

		return "dev/footer";
	}
}