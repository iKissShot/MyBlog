package top.kissshot.myblog.controller.web;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;
import top.kissshot.myblog.pojo.Comment;
import top.kissshot.myblog.pojo.CommentExample;

@RestController
public class RightController {

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

	@RequestMapping("/dev/right")
	public Model right(Model model, HttpServletRequest req) {

//		最热文章
		List<Article> hotArticles = articleMapper.selectByExample(new ArticleExample());
		Collections.sort(hotArticles, new Comparator<Article>() {
			@Override
			public int compare(Article o1, Article o2) {
				int index1 = o1.getCommentCount() + o1.getLikeCount() * 5 + o1.getCommentCount() * 20;
				int index2 = o2.getCommentCount() + o2.getLikeCount() * 5 + o2.getCommentCount() * 20;
				return index1 - index2;
			}
		});
		hotArticles = hotArticles.subList(0, hotArticles.size() < 8 ? hotArticles.size() : 11);
		model.addAttribute("hotArticles", hotArticles);

//		最新评论
		List<Comment> newComments = commentMapper.selectByExample(new CommentExample());
		Collections.sort(newComments, new Comparator<Comment>() {
			@Override
			public int compare(Comment o1, Comment o2) {
				return o1.getDate().compareTo(o2.getDate());
			}
		});
		newComments = newComments.subList(0, newComments.size() < 8 ? newComments.size() : 12);
		for (Comment c : newComments) {
			c.transEasyDate();
		}
		model.addAttribute("newComments", newComments);

		req.setAttribute("hotArticles", hotArticles);
		req.setAttribute("newComments", newComments);

		return model;
	}
}