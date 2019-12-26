package top.kissshot.myblog.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.kissshot.myblog.mapper._UserMapper;
import top.kissshot.myblog.pojo._User;

@Controller
public class _UserController_restful {
	@Autowired
	_UserMapper mapper;

	@PostMapping("/dev/Users")
	public String addUser(_User user) throws Exception {
		mapper.save(user);
		return "redirect:/dev/Users";
	}

	@DeleteMapping("/dev/Users/{uid}")
	public String deleteUser(_User user) throws Exception {
		mapper.delete(user.getUid());
		return "redirect:/dev/Users";
	}

	@PutMapping("/dev/Users/{uid}")
	public String updateUser(_User user) throws Exception {
		mapper.update(user);
		return "redirect:/dev/Users";
	}

	@GetMapping("/dev/Users/{uid}")
	public String editUser(Model model, @PathVariable("uid") int uid) throws Exception {
		model.addAttribute("user", mapper.get(uid));
		return "dev/editUser_restful";
	}

	@GetMapping("/dev/Users")
	public String listUserByPage(Model model, @RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "2") int size) throws Exception {
		start = start < 1 ? 1 : start;

		PageHelper.startPage(start, size, "uid DESC");
		List<_User> us = mapper.list();
		PageInfo<_User> page = new PageInfo<_User>(us);
		model.addAttribute("page", page);
		return "dev/listUserByPage_restful";
	}
}