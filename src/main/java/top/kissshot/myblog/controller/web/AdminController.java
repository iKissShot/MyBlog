package top.kissshot.myblog.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;
import top.kissshot.myblog.pojo.Comment;
import top.kissshot.myblog.pojo.CommentExample;
import top.kissshot.myblog.pojo.Label;
import top.kissshot.myblog.pojo.LabelExample;
import top.kissshot.myblog.pojo.Sort;
import top.kissshot.myblog.pojo.SortExample;
import top.kissshot.myblog.pojo.User;
import top.kissshot.myblog.pojo.UserExample;

@Controller
public class AdminController {

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

//	删除
	@RequestMapping("/dev/adminCenter/deleteUser/{uid}")
	public String deleteUser(@PathVariable Integer uid) {
		userMapper.deleteByPrimaryKey(uid);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/deleteArticle/{aid}")
	public String deleteArticle(@PathVariable Integer aid) {
		articleMapper.deleteByPrimaryKey(aid);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/deleteComment/{cid}")
	public String deleteComment(@PathVariable Integer cid) {
		commentMapper.deleteByPrimaryKey(cid);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/deleteSort/{sid}")
	public String deleteSort(@PathVariable Integer sid) {
		sortMapper.deleteByPrimaryKey(sid);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/deleteLabel/{lid}")
	public String deleteLabel(@PathVariable Integer lid) {
		labelMapper.deleteByPrimaryKey(lid);
		return "redirect:/dev/adminCenter";
	}

//	修改
	@RequestMapping("/dev/adminCenter/updateUser")
	public String updateUser(@RequestBody User user) {
		userMapper.updateByPrimaryKeySelective(user);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/updateArticle")
	public String updateArticle(@RequestBody Article article) {
		articleMapper.updateByPrimaryKey(article);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/updateComment")
	public String updateComment(@RequestBody Comment comment) {
		commentMapper.updateByPrimaryKeySelective(comment);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/updateSort")
	public String updateSort(@RequestBody Sort sort) {
		sortMapper.updateByPrimaryKeySelective(sort);
		return "redirect:/dev/adminCenter";
	}

	@RequestMapping("/dev/adminCenter/updateLabel")
	public String updateLabel(@RequestBody Label label) {
		System.err.println(label.toString());
		labelMapper.updateByPrimaryKeySelective(label);
		return "redirect:/dev/adminCenter";
	}

//	增加在AjaxController


//	管理中心
	@RequestMapping("/dev/adminCenter")
	public String adminCenter(Model model, @RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "5") int size) {
		start = start < 1 ? 1 : start;

		PageHelper.startPage(start, size, "uid DESC");
		List<User> users = userMapper.selectByExample(new UserExample());
		PageInfo<User> userPage = new PageInfo<User>(users);
		model.addAttribute("userPage", userPage);

		PageHelper.startPage(start, size, "aid DESC");
		List<Article> articles = articleMapper.selectByExample(new ArticleExample());
		PageInfo<Article> articlePage = new PageInfo<Article>(articles);
		model.addAttribute("articlePage", articlePage);

		PageHelper.startPage(start, size, "cid DESC");
		List<Comment> comments = commentMapper.selectByExample(new CommentExample());
		PageInfo<Comment> commentPage = new PageInfo<Comment>(comments);
		model.addAttribute("commentPage", commentPage);

		PageHelper.startPage(start, size, "sid DESC");
		List<Sort> sorts = sortMapper.selectByExample(new SortExample());
		PageInfo<Sort> sortPage = new PageInfo<Sort>(sorts);
		model.addAttribute("sortPage", sortPage);

		PageHelper.startPage(start, size, "lid DESC");
		List<Label> labels = labelMapper.selectByExample(new LabelExample());
		PageInfo<Label> labelPage = new PageInfo<Label>(labels);
		model.addAttribute("labelPage", labelPage);

//		System.err.println(userPage.getSize());
//		System.err.println(articlePage.getSize());
//		System.err.println(commentPage.getSize());
//		System.err.println(sortPage.getSize());
//		System.err.println(labelPage.getSize());
//		System.err.println(labelPage.getList().get(0).toString());

// 		model.addAttribute("users", userMapper.selectByExample(new UserExample()));
//		model.addAttribute("articles", articleMapper.selectByExample(new ArticleExample()));
//		model.addAttribute("comments", commentMapper.selectByExample(new CommentExample()));
//		model.addAttribute("sorts", sortMapper.selectByExample(new SortExample()));
//		model.addAttribute("labels", labelMapper.selectByExample(new LabelExample()));

		model.addAttribute("userCount", userMapper.selectByExample(new UserExample()).size());
		model.addAttribute("articleCount", articleMapper.selectByExample(new ArticleExample()).size());
		model.addAttribute("commentCount", commentMapper.selectByExample(new CommentExample()).size());
		model.addAttribute("sortCount", sortMapper.selectByExample(new SortExample()).size());
		model.addAttribute("labelCount", labelMapper.selectByExample(new LabelExample()).size());

		return "/dev/adminCenter";
	}
}