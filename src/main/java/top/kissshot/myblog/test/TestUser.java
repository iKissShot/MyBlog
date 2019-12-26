package top.kissshot.myblog.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import top.kissshot.myblog.Application;
import top.kissshot.myblog.mapper._UserMapper;
import top.kissshot.myblog.pojo._User;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestUser {
	@Autowired
	_UserMapper mapper_mine;

	@Test
	public void testUser_mine() {
		System.err.println("=================");
		List<_User> us = mapper_mine.list();
		for (_User u : us) {
			System.out.println("user info:" + u.toString());
		}
	}
}