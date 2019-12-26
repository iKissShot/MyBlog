package top.kissshot.myblog.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.kissshot.myblog.mapper._UserMapper;
import top.kissshot.myblog.pojo._User;

@Controller
public class _UserController {
	@Autowired
	_UserMapper mapper;

	@RequestMapping("/dev/addUser")
	public String addUser(_User user) throws Exception {
		mapper.save(user);
		return "redirect:/dev/listUserByPage";
	}

	@RequestMapping("/dev/deleteUser")
	public String deleteUser(int uid) throws Exception {
		mapper.delete(uid);
		return "redirect:/dev/listUserByPage";
	}

	@RequestMapping("/dev/updateUser")
	public String updateUser(Model model, _User user) throws Exception {
		mapper.update(user);
		return "redirect:/dev/listUserByPage";
	}

	@RequestMapping("/dev/editUser")
	public String editUser(Model model, int uid) throws Exception {
		model.addAttribute("user", mapper.get(uid));
		return "dev/editUser";
	}

	@RequestMapping("/dev/listUserByPage")
	public String listUserByPage(Model model, @RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "2") int size) throws Exception {
		if (start < 1) {
			model.addAttribute("start", 1);
		}
		PageHelper.startPage(start, size, "uid DESC");
		List<_User> us = mapper.list();
		PageInfo<_User> page = new PageInfo<_User>(us);
		model.addAttribute("page", page);
		return "dev/listUserByPage";
	}

	@RequestMapping("/dev/listUser")
	public String listUser(Model model) throws Exception {
		List<_User> us = mapper.list();
		for (_User u : us)
			System.out.println(u.toString());
		model.addAttribute("us", us);
		return "dev/listUser";
	}
}