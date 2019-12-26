package top.kissshot.myblog.controller.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import top.kissshot.myblog.mapper.ColorPlattesMapper;
import top.kissshot.myblog.pojo.ColorPlattes;
import top.kissshot.myblog.pojo.ColorPlattesExample;

@RestController
public class ColorAjaxController {

	@Autowired
	ColorPlattesMapper colorMapper;

	@GetMapping("/Utils/Color/viewCountUp/{cid}")
	public int viewCountUp(@PathVariable Integer cid) {
		colorMapper.viewCountUp(cid);
		return colorMapper.selectByPrimaryKey(cid).getViewcount();
	}

	@GetMapping("/Utils/Color/likeCountUp/{cid}")
	public int likeCountUp(@PathVariable Integer cid) {
		colorMapper.likeCountUp(cid);
		return colorMapper.selectByPrimaryKey(cid).getLikecount();
	}

	@GetMapping("/Utils/Color/getColors/{type}")
	public List<ColorPlattes> getColors(@PathVariable String type) {
		ColorPlattesExample example = new ColorPlattesExample();
		type = type.equals("New") ? "cid" : "likeCount";
		example.setOrderByClause(type + " DESC");
		List<ColorPlattes> list = colorMapper.selectByExample(example);
		return list;
	}

	@GetMapping("/Utils/Color/addColor/{c1}/{c2}/{c3}/{c4}")
	public int addColor(@PathVariable String c1, @PathVariable String c2, @PathVariable String c3,
			@PathVariable String c4) {
		System.err.println(c1 + ":" + c2 + ":" + c3 + ":" + c4);
		colorMapper.insertSelective(new ColorPlattes(c1, c2, c3, c4));
		int cid = colorMapper.getLastCid();
		return cid;
	}
}