package top.kissshot.myblog.controller.utils;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import top.kissshot.myblog.mapper.CategoryMapper;
import top.kissshot.myblog.mapper.NavMapper;
import top.kissshot.myblog.mapper.SiteMapper;
import top.kissshot.myblog.mapper.UserMapper;
import top.kissshot.myblog.pojo.Category;
import top.kissshot.myblog.pojo.Nav;
import top.kissshot.myblog.pojo.Site;

@Controller
public class NavigatorContoller {

	@Autowired
	NavMapper navMapper;

	@Autowired
	CategoryMapper categoryMapper;

	@Autowired
	SiteMapper siteMapper;

	@Autowired
	UserMapper userMapper;

	@RequestMapping("/Utils/Nav")
	public String navigator(Model model, HttpServletRequest req) {
		int uid;
		Nav nav = null;
		if (req.getSession().getAttribute("uid") != null) {
			uid = Integer.parseInt(req.getSession().getAttribute("uid") + "");
			nav = navMapper.selectByUid(uid);
			System.err.println("uid = " + uid);
		} else {
			uid = 1;
		}

		if (nav == null) {
			nav = new Nav();
			nav.setUid(uid);
			System.err.println("nav = " + nav);
			navMapper.insertSelective(nav);
			int nid = navMapper.selectByUid(uid).getNid();
			System.err.println("nid = " + nid);

			Category newCategory = new Category();
			newCategory.setCount(1);
			newCategory.setName("新增分类");
			newCategory.setNid(nid);
			newCategory.setOrder(1);
			categoryMapper.insertSelective(newCategory);
			int cid = categoryMapper.getLastCidByNid(nid);
			System.err.println("cid = " + cid);

			Site newSite = new Site();
			newSite.setCid(cid);
			newSite.setIcon("icon");
			newSite.setName("新增站点");
			newSite.setOrder(1);
			newSite.setUrl("http://KissShot.top");
			siteMapper.insertSelective(newSite);
		}

		List<Category> categories = categoryMapper.listByNid(navMapper.selectByUid(uid).getNid());
		for (Category c : categories)
			System.err.println(c.toString());

		Collections.sort(categories, new Comparator<Category>() {
			@Override
			public int compare(Category o1, Category o2) {
				return o1.getOrder() - o2.getOrder();
			}
		});
		for (Category c : categories) {
			List<Site> sites = siteMapper.listByCid(c.getCid());
			Collections.sort(sites, new Comparator<Site>() {
				@Override
				public int compare(Site o1, Site o2) {
					return o1.getOrder() - o2.getOrder();
				}
			});
			req.setAttribute("cid" + c.getCid(), siteMapper.listByCid(c.getCid()));
		}
		req.setAttribute("categories", categories);
		model.addAttribute("type", nav.getType());
		model.addAttribute("user", userMapper.selectByPrimaryKey(Integer.parseInt(uid + "")));
		return "/utils/_02_nav/index";
	}
}