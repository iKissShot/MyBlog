package top.kissshot.myblog.controller.web.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
import top.kissshot.myblog.pojo.Label;
import top.kissshot.myblog.pojo.LabelExample;
import top.kissshot.myblog.pojo.Sort;
import top.kissshot.myblog.pojo.SortExample;
import top.kissshot.myblog.pojo.User;
import top.kissshot.myblog.pojo.UserExample;

@RestController
public class AjaxController {
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

//	adminCenter增加数据
	@RequestMapping("/dev/adminCenter/addUser")
	public User addUser(@RequestBody User user) {
		userMapper.insertSelective(user);
		List<User> users = userMapper.selectByExample(new UserExample());
		return users.get(users.size() - 1);
	}

	@RequestMapping("/dev/adminCenter/addArticle")
	public Article addArticle(@RequestBody Article article) {
		articleMapper.insertSelective(article);
		List<Article> sorts = articleMapper.selectByExample(new ArticleExample());
		return sorts.get(sorts.size() - 1);
	}

	@RequestMapping("/dev/adminCenter/addComment")
	public Comment addComment(@RequestBody Comment comment) {
		commentMapper.insertSelective(comment);
		List<Comment> comments = commentMapper.selectByExample(new CommentExample());
		return comments.get(comments.size() - 1);
	}

	@RequestMapping("/dev/adminCenter/addSort")
	public Sort insertSelective(@RequestBody Sort sort) {
		sortMapper.insertSelective(sort);
		List<Sort> sorts = sortMapper.selectByExample(new SortExample());
		return sorts.get(sorts.size() - 1);
	}

	@RequestMapping("/dev/adminCenter/addLabel")
	public Label addLabel(@RequestBody Label label) {
		labelMapper.insertSelective(label);
		List<Label> labels = labelMapper.selectByExample(new LabelExample());
		return labels.get(labels.size() - 1);
	}

//	用户交互：点赞、浏览
	@RequestMapping("/dev/comment/likeup/{cid}")
	public int commentLikeUp(@PathVariable Integer cid) {
		commentMapper.likeCountUp(cid);
		return commentMapper.selectByPrimaryKey(cid).getLikeCount();
	}

	@RequestMapping("/dev/article/likeup/{aid}")
	public int articleLikeUp(@PathVariable Integer aid) {
//		System.out.println("articleLikeUp, aid = " + aid);
		articleMapper.likeCountUp(aid);
		return articleMapper.selectByPrimaryKey(aid).getLikeCount();
	}

	@RequestMapping("/dev/article/viewup/{aid}")
	public int articleViewUp(@PathVariable Integer aid) {
//		System.out.println("articleViewUp, aid = " + aid);
		articleMapper.viewCountUp(aid);
		return articleMapper.selectByPrimaryKey(aid).getViewCount();
	}
}