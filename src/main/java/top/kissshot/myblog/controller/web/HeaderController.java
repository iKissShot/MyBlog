package top.kissshot.myblog.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.util.StringUtil;

import top.kissshot.myblog.mapper.UserMapper;

@Controller
public class HeaderController {

	@Autowired
	UserMapper userMapper;

	@RequestMapping("/dev/header")
	public String header(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Object uidObj = session.getAttribute("uid");
		if (uidObj != null) {
			String uidStr = uidObj + "";
			session.setAttribute("name", userMapper.selectByPrimaryKey(Integer.parseInt(uidStr)).getName());
		}
		return "dev/header";
	}
}