package top.kissshot.myblog.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import top.kissshot.myblog.Application;
import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.CategoryMapper;
import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.mapper.LabelMapper;
import top.kissshot.myblog.mapper.SiteMapper;
import top.kissshot.myblog.mapper.SortMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;
import top.kissshot.myblog.pojo.Category;
import top.kissshot.myblog.pojo.CategoryExample;
import top.kissshot.myblog.pojo.Comment;
import top.kissshot.myblog.pojo.CommentExample;
import top.kissshot.myblog.pojo.Label;
import top.kissshot.myblog.pojo.LabelExample;
import top.kissshot.myblog.pojo.Site;
import top.kissshot.myblog.pojo.SiteExample;
import top.kissshot.myblog.pojo.Sort;
import top.kissshot.myblog.pojo.SortExample;
import top.kissshot.myblog.pojo.User;
import top.kissshot.myblog.pojo.UserExample;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestData {
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

	@Autowired
	SiteMapper siteMapper;

	@Autowired
	CategoryMapper categoryMapper;

	// @Test
	public void test() {
		System.err.println("======== Start Test ========");
		for (User u : userMapper.selectByExample(new UserExample()))
			System.out.println(u.toString());
		for (Article u : articleMapper.selectByExample((new ArticleExample())))
			System.out.println(u.toString());
		for (Comment u : commentMapper.selectByExample(new CommentExample()))
			System.out.println(u.toString());
		for (Sort u : sortMapper.selectByExample(new SortExample()))
			System.out.println(u.toString());
		for (Label u : labelMapper.selectByExample(new LabelExample()))
			System.out.println(u.toString());
		System.err.println("======== Finish Test ========");
	}

	@Test
	public void testNav() {
		System.err.println("======== Start Test ========");
		for (Category u : categoryMapper.selectByExample(new CategoryExample()))
			System.out.println(u.toString());
		for (Site u : siteMapper.selectByExample(new SiteExample()))
			System.out.println(u.toString());
		System.err.println("======== Finish Test ========");
	}
}