package top.kissshot.myblog.controller.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import top.kissshot.myblog.mapper.CommentMapper;
import top.kissshot.myblog.pojo.Comment;

@Controller
public class CommentController {
	@Autowired
	CommentMapper commentMapper;

	@RequestMapping("/dev/addComment")
	public String addComment(RedirectAttributes redAttr, Comment tempComment, HttpServletRequest res) throws Exception {
		Object uidObj = res.getSession().getAttribute("uid");
		if (uidObj != null) {
			int uid = Integer.parseInt(uidObj + "");
			Comment comment = new Comment(uid, tempComment.getAid(), 0, tempComment.getContent(), new Date());
			System.err.println(comment.toString());
			commentMapper.insertSelective(comment);
			redAttr.addAttribute("aid", comment.getAid());
			return "redirect:/dev/article";
		} else {
			throw new Exception("请先登录");
		}
	}
}