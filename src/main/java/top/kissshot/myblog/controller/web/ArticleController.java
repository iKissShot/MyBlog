package top.kissshot.myblog.controller.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;
import top.kissshot.myblog.pojo.Comment;
import top.kissshot.myblog.pojo.CommentExample;

@Controller
public class ArticleController {

	@Autowired
	UserMapper userMapper;

	@Autowired
	ArticleMapper articleMapper;

	@Autowired
	CommentMapper commentMapper;

	@Autowired
	SortMapper SortMapper;

	@Autowired
	LabelMapper labelMapper;

	@RequestMapping("/dev/article")
	public String index(Model model, Integer aid) {
		{
			Article article = articleMapper.selectByPrimaryKey(aid);
			article.transEasyDate();
			model.addAttribute("article", article);

			List<Comment> articleComments = new ArrayList<Comment>();
			for (Comment c : commentMapper.selectByExample(new CommentExample())) {
				if (c.getAid() == aid) {
					c.transEasyDate();
					articleComments.add(c);
				}
			}

			model.addAttribute("articleComments", articleComments);
			model.addAttribute("articleCommentsCount", articleComments.size());
		}

//		最热文章
		{
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
			model.addAttribute("hotArticles", hotArticles);
		}

//		最新评论
		{
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
			}
			model.addAttribute("newComments", newComments);
		}

		return "dev/article";
	}

	@RequestMapping("/dev/updateArticle")
	public String updateArticle(Model model, Article article) {
		articleMapper.updateByPrimaryKey(article);
		return "redirect:/dev/index";
	}
}