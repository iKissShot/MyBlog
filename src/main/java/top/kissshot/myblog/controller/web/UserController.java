package top.kissshot.myblog.controller.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.kissshot.myblog.mapper.ArticleMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.User;

@Controller
public class UserController {

	String backUrl;

	@Autowired
	UserMapper userMapper;

	@Autowired
	ArticleMapper articleMapper;

//	退出登录
	@RequestMapping("/dev/userOut")
	public String userOut(HttpServletRequest req) {
		req.getSession().removeAttribute("uid");
		req.getSession().removeAttribute("name");

		backUrl = null;
		req.getSession().removeAttribute("backUrl");

		return "redirect:/dev/index";
	}

//	用户注册
	@RequestMapping("/dev/userRegist")
	public String userRegist(HttpServletRequest req) {
		System.err.println(req.getAttribute("href"));
		return "dev/regist";
	}

	@RequestMapping("/dev/userRegistConfirm")
	public String userRegistComfirm(Model model, User user, HttpServletRequest req) {
		System.err.println(user.toString());
		if (userMapper.findByName(user) != null) {
			System.err.println("已存在该用戶");
			return "redirect:/dev/userRegist";
		}
		user.setDate(new Date());
		userMapper.insertSelective(user);
		req.getSession().setAttribute("uid", user.getUid());
		req.getSession().setAttribute("name", user.getName());

//		System.err.println("注册成功");
		return "redirect:/dev/login";
	}

//	用户登录
	@RequestMapping("/dev/userLogin")
	public String userLogin() {
		return "dev/login";
	}

	@RequestMapping("/dev/userLoginBack")
	public String userLoginBack(HttpServletRequest req) {
//		?href=http://127.0.0.1:8080/WEB-INF/jsp/dev/article.jsp?aid=44 -> /dev/article.jsp?aid=44 -> /dev/article?aid=44 
//		backUrl = req.getParameter("href");
//		backUrl = backUrl.split(".jsp")[0] + backUrl.split(".jsp")[1];
//		System.err.println("userLogin:" + backUrl);

		backUrl = req.getSession().getAttribute("backUrl") + "";

		return "dev/login";
	}

	@RequestMapping("/dev/userLoginConfirm")
	public String userLoginComfirm(Model model, User temUser, HttpServletRequest req) {
		System.err.println(temUser.toString());
		User user = userMapper.findByUp(temUser);
		if (user != null) {

			req.getSession().setAttribute("uid", user.getUid());
			req.getSession().setAttribute("name", user.getName());

			System.err.println("已登录");
//			System.err.println("userLoginComfirm:" + backUrl);

			backUrl = req.getSession().getAttribute("backUrl") + "";
//			if (backUrl != null)
//				return "redirect:" + backUrl;
//			else
			return "redirect:/dev/index";
		} else {
			req.getSession().removeAttribute("uid");
			req.getSession().removeAttribute("name");

			System.err.println("信息错误");
			return "redirect:/dev/userLogin";
		}
	}

	@RequestMapping("/dev/userCenter")
	public String userCenter(Model model, HttpServletRequest req,
			@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		HttpSession session = req.getSession();
		int uid = Integer.parseInt(session.getAttribute("uid") + "");

		start = start < 1 ? 1 : start;

		PageHelper.startPage(start, size, "aid DESC");
		List<Article> articles = articleMapper.findByUid(uid);
		PageInfo<Article> page = new PageInfo<Article>(articles);

		model.addAttribute("page", page);

		User user = userMapper.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		model.addAttribute("articlesCount", articleMapper.findByUid(uid).size());

		return "dev/userCenter";
	}

	@RequestMapping("/dev/userEdit")
	public String userEdit(Model model, HttpServletRequest req) {
		int uid = Integer.parseInt(req.getSession().getAttribute("uid") + "");
		model.addAttribute("user", userMapper.selectByPrimaryKey(uid));

		return "dev/userEdit";
	}

	@RequestMapping("/dev/userUpdate")
	public String userUpdate(Model model, User user) {
		System.err.println(user.toString());
		userMapper.updateByPrimaryKeySelective(user);

		return "redirect:/dev/userCenter";
	}
}