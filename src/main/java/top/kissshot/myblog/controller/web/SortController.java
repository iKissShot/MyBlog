package top.kissshot.myblog.controller.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import top.kissshot.myblog.pojo.Sort;

@Controller
public class SortController {

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

	@RequestMapping("/dev/sort")
	public String index(Model model, @RequestParam(value = "start", defaultValue = "1") Integer start,
			@RequestParam(value = "size", defaultValue = "5") Integer size, Integer sid) {
		System.err.println(start + ":" + size + ":" + sid);
		start = start < 1 ? 1 : start;
		PageHelper.startPage(start, size, "aid DESC");
		List<Article> articles = articleMapper.listBySid(sid);
		PageInfo<Article> page = new PageInfo<Article>(articles);

//		未分页
//		List<Article> articles = new ArrayList<>();
//		for (Article a : articleMapper.selectByExample(new ArticleExample())) {
//			if (a.getSid() == sid) {
//				articles.add(a);
//			}
//		}
		model.addAttribute("sort", sortMapper.selectByPrimaryKey(sid));
		model.addAttribute("page", page);
		model.addAttribute("articlesCount", articleMapper.listBySid(sid).size());

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
		hotArticles = hotArticles.subList(0, hotArticles.size() < 8 ? hotArticles.size() : 8);
		for (Article a : hotArticles)
			System.out.println(a.toString());
		model.addAttribute("hotArticles", hotArticles);

//		最新评论
		List<Comment> newComments = commentMapper.selectByExample(new CommentExample());
		Collections.sort(newComments, new Comparator<Comment>() {
			@Override
			public int compare(Comment o1, Comment o2) {
				return o1.getDate().compareTo(o2.getDate());
			}
		});
		newComments = newComments.subList(0, newComments.size() < 8 ? newComments.size() : 8);
		for (Comment c : newComments) {
			c.transEasyDate();
			System.out.println(c.toString());
		}
		model.addAttribute("newComments", newComments);

		return "dev/sort";
	}
}