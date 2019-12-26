package top.kissshot.myblog.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.kissshot.myblog.mapper._UserMapper;
import top.kissshot.myblog.pojo._User;

@RestController
public class _UserController_json {
	@Autowired
	_UserMapper mapper;

	@GetMapping("/dev/UserJSON")
	public List<_User> getAllUser(@RequestParam(value = "start", defaultValue = "1") int start,
			@RequestParam(value = "size", defaultValue = "5") int size) {
		start = start < 1 ? 1 : start;
		PageHelper.startPage(start, size, "uid DESC");
		List<_User> us = mapper.list();
		PageInfo<_User> page = new PageInfo<_User>(us);
		for (_User u : page.getList())
			System.out.println(u.toString());
		return page.getList();
	}

	@GetMapping("/dev/UserJSON/{uid}")
	public _User getOntUser(@PathVariable("uid") int uid) {
		System.out.println(mapper.get(uid));
		return mapper.get(uid);
	}

	@PutMapping("/dev/UserJSON")
	public void addOneUser(@RequestBody _User user) {
		System.out.println(user.toString());
	}
}